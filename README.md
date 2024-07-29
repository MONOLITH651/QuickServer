This repository contain script to start a simple web server using powershell. 
The script is designed for quick paylod delivery and testing when traditional solutions are not available.

To run the **PowerShell** script that sets up an HTTP server, you need to ensure that the following components are present on the host:

    1. PowerShell is available by default on Windows systems.
    2. .NET Framework or .NET Core:
        - On Windows, the script uses the .NET Framework classes (System.Net.HttpListener). 
        - Windows systems typically have the .NET Framework pre-installed. 
        - You may need at least .NET Framework 4.5 or later, depending on the specific classes and methods used.
        - On Linux and macOS, if using PowerShell Core, the underlying libraries are provided through .NET Core, which should be installed along with PowerShell Core.
    3. Permissions:
        - Admin Privileges: Running an HTTP listener on ports below 1024 typically requires administrative privileges. 
        - Make sure to run PowerShell with elevated permissions if needed, especially for ports like 80 or 443.
        - Firewall Rules: Ensure that the firewall allows inbound connections on the specified port. You may need to configure firewall rules to permit HTTP traffic on the chosen port.

No additional specific packages or modules need to be installed if these prerequisites are met.

Example
To start server
```powershell
PS C:\Users\Administrator\Desktop> .\HTTP.ps1 -Port 8000
HTTP server running on port 8000
```
