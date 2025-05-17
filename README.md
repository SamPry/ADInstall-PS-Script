# Active Directory Installation Script  

This PowerShell script automates the installation and configuration of **Active Directory Domain Services (AD DS)** on a Windows Server, creating a new forest with your specified domain name.  

## Features  
- Installs **AD DS** and **DNS Server** roles  
- Configures a new **Active Directory forest**  
- Sets up **NTDS, SYSVOL, and DNS** with default paths  
- Automatically restarts the server if required  

## Usage  
1. **Run the script as Administrator** in PowerShell.  
2. Enter your desired **domain name** (e.g., `company.local`).  
3. Set a **Directory Services Restore Mode (DSRM)** password.  
4. The server will reboot to complete the installation.  

### Requirements  
- **Windows Server 2012 R2 or later**  
- **Administrator privileges**  
- **PowerShell Execution Policy** set to `RemoteSigned` or `Unrestricted`  

> **Warning:** Running this script will promote the server to a domain controller. Test in a lab environment first!  
