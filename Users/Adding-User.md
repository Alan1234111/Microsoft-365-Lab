# 👤 User Provisioning & Role Management

🛠️ This section documents the end-to-end process of onboarding new users within the Microsoft 365

---

### 1. User Creation & Identity Setup

New identities are created via the Microsoft 365 Admin Center. During this phase, basic identity details are defined, and security defaults are established.

- Security Policy: All new users are issued a temporary, system-generated password.

- Enforcement: The "Require change at first logon" flag is enabled to ensure the user establishes a private credential immediately.

<img width="1587" height="1162" alt="image" src="https://github.com/user-attachments/assets/81fd2034-9fe8-471d-9a79-02c55c4b664a" />

### 2. Licensing & RBAC (Role-Based Access Control)

- License: Assigned Microsoft 365 Business Standard (includes Exchange, Teams, and Desktop Apps).

- Administrative Role: Granted the User Administrator role, allowing the user to manage password resets and user profiles without having Global Admin privileges.

<img width="1567" height="1145" alt="image" src="https://github.com/user-attachments/assets/980ad834-f433-46d4-8f66-f0afeee682f0" />

---

<img width="1572" height="1152" alt="image" src="https://github.com/user-attachments/assets/db048ac9-7cd2-44e8-859e-9396a251559c" />

---

<img width="1591" height="1140" alt="image" src="https://github.com/user-attachments/assets/ac390caf-3d30-4d7f-981c-73e4dd6d02bc" />

---

### 3. Profile Optimization & Templates

- To streamline future onboarding, the configuration is validated for accuracy and saved as a Helpdesk Template.

<img width="1590" height="1149" alt="image" src="https://github.com/user-attachments/assets/867c55ec-c22c-4fbc-9a1c-26cd7340e3f4" />

---

<img width="1606" height="1079" alt="image" src="https://github.com/user-attachments/assets/86c40277-3b83-4d97-8bcb-ba0d4eb1e815" />

---

<img width="1651" height="1155" alt="image" src="https://github.com/user-attachments/assets/edb2e0f1-3cda-4422-a95a-a796ea3c3cc7" />

---

### 4. Credential Handover & Security Verification

- Before the onboarding is complete, the temporary credentials are generated and the user's initial login flow is tested
  
<img width="742" height="238" alt="image" src="https://github.com/user-attachments/assets/53518eb4-2fce-4a65-bf0a-ebb974f36fb5" />

---

<img width="900" height="678" alt="image" src="https://github.com/user-attachments/assets/d639bbf9-605a-4f4d-aa55-493ed8302bcc" />



### 5. Final Sign-in Verification

The process ends by verifying the end-user experience. This ensures that the licenses have provisioned correctly and services like Outlook are accessible.

<img width="729" height="700" alt="image" src="https://github.com/user-attachments/assets/a26f1bb1-e183-4e38-9223-958a306f3758" />

---

<img width="1711" height="841" alt="image" src="https://github.com/user-attachments/assets/d59bc5ba-f789-43a6-bc51-6a52d6bba4f8" />

--- 

### ✅ Configuration Summary
The following steps were completed to set up the new user environment:

- User Creation: Created users via the GUI

- Role & Permissions: Assigned appropriate permissions and the User Administrator role.

- Licensing: Provisioned the user with a Microsoft 365 Business Standard license.

- Password Security: Generated a temporary random password and enabled the requirement for the user to change it upon their initial login.

- Data Validation: Populated the user profile information and verified all details for accuracy.

- Final Testing: Verified that the password change prompt is active and confirmed the user can successfully sign in to Outlook.

