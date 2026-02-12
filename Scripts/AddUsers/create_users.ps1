function New-RandomPassword {
    param (
        [int]$Length = 12
    )
    $upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    $lower = "abcdefghijklmnopqrstuvwxyz"
    $digits = "0123456789"
    $special = "!@#$%^&*"
    
    $p = @(
        ($upper.ToCharArray() | Get-Random -Count 1),
        ($lower.ToCharArray() | Get-Random -Count 1),
        ($digits.ToCharArray() | Get-Random -Count 1),
        ($special.ToCharArray() | Get-Random -Count 1)
    )
    
    $allChars = $upper + $lower + $digits + $special
    $p += ($allChars.ToCharArray() | Get-Random -Count ($Length - 4))
    
    return -join ($p | Sort-Object {Get-Random})
}

Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"

$skuId = "ID LICENCJI" 
$csvPath = "C:\Users\User\Desktop\NewEmployees.csv"
$outputPath = "C:\Users\User\Desktop\Utworzeni_Hasla.csv" # Plik z wynikami
$users = Import-Csv -Path $csvPath -Delimiter "," 
$results = @() # Lista do raportu

foreach($user in $users) {
    Write-Host "Przetwarzanie $($user.UserPrincipalName)..." -ForegroundColor Cyan

    $randomPassword = New-RandomPassword -Length 12

    $passwordProfile = @{
        Password = $randomPassword
        ForceChangePasswordNextSignIn = $true
    }

    
    $userParams = @{
        AccountEnabled    = $true
        DisplayName       = $user.DisplayName
        UserPrincipalName = $user.UserPrincipalName
        MailNickname      = $user.MailNickname
        JobTitle          = $user.JobTitle
        Department        = $user.Department
        OfficeLocation    = $user.OfficeLocation
        MobilePhone       = $user.MobilePhone
        StreetAddress     = $user.StreetAddress
        City              = $user.City
        PostalCode        = $user.PostalCode
        UsageLocation     = $user.UsageLocation
        PasswordProfile   = $passwordProfile
    }

    try {
        
        $newUser = New-MgUser @userParams
        
        Write-Host "Sukces: Konto utworzone. ID: $($newUser.Id)" -ForegroundColor Green

        # Czekamy chwilę na propagację w Azure AD
        Start-Sleep -Seconds 5 

        # Nadanie licencji
        Set-MgUserLicense -UserId $newUser.Id -AddLicenses @{SkuId = $skuId} -RemoveLicenses @()
        Write-Host "Licencja przypisana." -ForegroundColor Green

        # Dodanie do raportu
        $results += [PSCustomObject]@{
            UserPrincipalName = $user.UserPrincipalName
            Password          = $randomPassword
            Status            = "Success"
        }

    } catch {
        Write-Host "BŁĄD przy użytkowniku $($user.UserPrincipalName): $($_.Exception.Message)" -ForegroundColor Red
        
        $results += [PSCustomObject]@{
            UserPrincipalName = $user.UserPrincipalName
            Password          = "ERROR"
            Status            = $_.Exception.Message
        }
    }
}

# Zapisanie haseł do pliku
$results | Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8
Write-Host "Zakończono! Hasła zapisane w: $outputPath" -ForegroundColor Yellow
