<?xml version="1.0" encoding="UTF-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend">
   <settings pass="windowsPE">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-International-Core-WinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <SetupUILanguage>
            <UILanguage>en-US</UILanguage>
         </SetupUILanguage>
         <InputLocale>${vm_inst_os_keyboard}</InputLocale>
         <SystemLocale>${vm_inst_os_language}</SystemLocale>
         <UILanguage>${vm_inst_os_language}</UILanguage>
         <UILanguageFallback>${vm_inst_os_language}</UILanguageFallback>
         <UserLocale>${vm_inst_os_language}</UserLocale>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-PnpCustomizationsWinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <DriverPaths>
            <PathAndCredentials wcm:action="add" wcm:keyValue="1">
               <Path>E:\Program Files\VMware\VMware Tools\Drivers\pvscsi\Win8\amd64</Path>
            </PathAndCredentials>
         </DriverPaths>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <DiskConfiguration>
            <Disk wcm:action="add">
                <CreatePartitions>
                    <CreatePartition wcm:action="add">
                        <Type>Primary</Type>
                        <Size>512</Size>
                        <Order>1</Order>
                    </CreatePartition>
                    <CreatePartition wcm:action="add">
                        <Extend>false</Extend>
                        <Type>Primary</Type>
                        <Size>1024</Size>
                        <Order>2</Order>
                    </CreatePartition>
                    <CreatePartition wcm:action="add">
                        <Extend>true</Extend>
                        <Type>Primary</Type>
                        <Order>3</Order>
                    </CreatePartition>
                </CreatePartitions>
                <ModifyPartitions>
                    <ModifyPartition wcm:action="add">
                        <Active>true</Active>
                        <Format>NTFS</Format>
                        <Label>System</Label>
                        <Extend>false</Extend>
                        <Order>1</Order>
                        <PartitionID>1</PartitionID>
                    </ModifyPartition>
                    <ModifyPartition wcm:action="add">
                        <Format>NTFS</Format>
                        <TypeID>0x27</TypeID>
                        <Label>Recovery</Label>
                        <Order>2</Order>
                        <PartitionID>2</PartitionID>
                    </ModifyPartition>
                    <ModifyPartition wcm:action="add">
                        <Format>NTFS</Format>
                        <Letter>C</Letter>
                        <Order>3</Order>
                        <PartitionID>3</PartitionID>
                        <Label>Windows</Label>
                    </ModifyPartition>
                </ModifyPartitions>
                <DiskID>0</DiskID>
                <WillWipeDisk>true</WillWipeDisk>
            </Disk>
            <WillShowUI>OnError</WillShowUI>
        </DiskConfiguration>
         <ImageInstall>
            <OSImage>
               <InstallFrom>
                  <MetaData wcm:action="add">
                     <Key>/IMAGE/NAME</Key>
                     <Value>${vm_inst_os_image}</Value>
                  </MetaData>
               </InstallFrom>
               <InstallTo>
                  <DiskID>0</DiskID>
                  <PartitionID>3</PartitionID>
               </InstallTo>
               <InstallToAvailablePartition>false</InstallToAvailablePartition>
               <WillShowUI>OnError</WillShowUI>
            </OSImage>
         </ImageInstall>
         <UserData>
            <AcceptEula>true</AcceptEula>
         </UserData>
         <EnableFirewall>false</EnableFirewall>
      </component>
   </settings>
   <settings pass="offlineServicing">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-LUA-Settings" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <EnableLUA>false</EnableLUA>
      </component>
   </settings>
   <settings pass="generalize">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Security-SPP" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <SkipRearm>1</SkipRearm>
      </component>
   </settings>
   <settings pass="specialize">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <OEMInformation>
            <HelpCustomized>false</HelpCustomized>
         </OEMInformation>
         <TimeZone>${vm_guest_os_timezone}</TimeZone>
         <RegisteredOwner />
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-ServerManager-SvrMgrNc" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <DoNotOpenServerManagerAtLogon>true</DoNotOpenServerManagerAtLogon>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-OutOfBoxExperience" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <DoNotOpenInitialConfigurationTasksAtLogon>true</DoNotOpenInitialConfigurationTasksAtLogon>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Security-SPP-UX" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <SkipAutoActivation>true</SkipAutoActivation>
      </component>
   </settings>
   <settings pass="oobeSystem">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <AutoLogon>
            <Password>
               <Value>${build_password}</Value>
               <PlainText>true</PlainText>
            </Password>
            <Enabled>true</Enabled>
            <Username>${build_username}</Username>
         </AutoLogon>
         <OOBE>
            <HideEULAPage>true</HideEULAPage>
            <HideLocalAccountScreen>true</HideLocalAccountScreen>
            <HideOEMRegistrationScreen>true</HideOEMRegistrationScreen>
            <HideOnlineAccountScreens>true</HideOnlineAccountScreens>
            <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE>
            <NetworkLocation>Work</NetworkLocation>
            <ProtectYourPC>2</ProtectYourPC>
         </OOBE>
         <UserAccounts>
            <AdministratorPassword>
               <Value>${build_password}</Value>
               <PlainText>true</PlainText>
            </AdministratorPassword>
            <LocalAccounts>
               <LocalAccount wcm:action="add">
                  <Password>
                     <Value>${build_password}</Value>
                     <PlainText>true</PlainText>
                  </Password>
                  <Group>administrators</Group>
                  <DisplayName>${build_username}</DisplayName>
                  <Name>${build_username}</Name>
                  <Description>Build Account</Description>
               </LocalAccount>
            </LocalAccounts>
         </UserAccounts>
         <FirstLogonCommands>
            <SynchronousCommand wcm:action="add">
               <CommandLine>cmd.exe /c powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"</CommandLine>
               <Description>Set Execution Policy 64-Bit</Description>
               <Order>1</Order>
               <RequiresUserInput>true</RequiresUserInput>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\SysWOW64\cmd.exe /c %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"</CommandLine>
               <Description>Set Execution Policy 32-Bit</Description>
               <Order>2</Order>
               <RequiresUserInput>true</RequiresUserInput>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -File A:\windows-vmtools.ps1</CommandLine>
               <Order>3</Order>
               <Description>Install VMware Tools</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -File A:\windows-init.ps1</CommandLine>
               <Order>4</Order>
               <Description>Initial Configuration winrm</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -File A:\dhcp-ip.ps1</CommandLine>
               <Order>5</Order>
               <Description>Initial Configuration dhcp ip address</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -File A:\winrm-httpv1.ps1</CommandLine>
               <Order>6</Order>
               <Description>Initial Configuration winrm test</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v HideFileExt /t REG_DWORD /d 0 /f</CommandLine>
               <Order>7</Order>
               <Description>Show file extensions in Explorer</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>cmd.exe /c wmic useraccount where "name='Administrator'" set PasswordExpires=FALSE</CommandLine>
               <Order>8</Order>
               <Description>Disable password expiration for Administrator user</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v Start_ShowRun /t REG_DWORD /d 1 /f</CommandLine>
               <Order>9</Order>
               <Description>Show Run command in Start Menu</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v StartMenuAdminTools /t REG_DWORD /d 1 /f</CommandLine>
               <Order>10</Order>
               <Description>Show Administrative Tools in Start Menu</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateFileSizePercent /t REG_DWORD /d 0 /f</CommandLine>
               <Order>11</Order>
               <Description>Zero Hibernation File</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateEnabled /t REG_DWORD /d 0 /f</CommandLine>
               <Order>12</Order>
               <Description>Disable Hibernation Mode</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>cmd.exe /c wmic useraccount where "name='Administrator'" set PasswordExpires=FALSE</CommandLine>
               <Order>13</Order>
               <Description>Disable password expiration for Administrator user</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>Install-WindowsFeature Server-Gui-Mgmt-Infra,Server-Gui-Shell –Restart</CommandLine>
               <Order>14</Order>
               <Description>Install GUI</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>cmd.exe /c netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389</CommandLine>
               <Order>15</Order>
            <Description>Enable RDP Firewall</Description>
            </SynchronousCommand>
            <SynchronousCommand wcm:action="add">
               <CommandLine>%SystemRoot%\System32\reg.exe ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server /v fDenyTSConnections /t REG_DWORD /d 0 /f</CommandLine>
               <Order>16</Order>
            <Description>Enable RDP Registry</Description>
            </SynchronousCommand>
         </FirstLogonCommands>
      </component>
   </settings>
</unattend>
