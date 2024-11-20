

// Virtual Machine Guest Operating System Setting
vm_guest_os_type = "windows2019srv_64Guest"

// Virtual Machine Hardware Settings
vm_firmware              = "bios"

//communicator_port       = 5986

iso_datastore = "[workload_share_dwPsq] WindowsServer2019.iso"
vmtools_datastore = "[workload_share_dwPsq] vmware_tools_windows/VMware-tools-windows-12.4.5-23787635.iso"

//Setting up winrm and vmtools
script_files            = ["files/win_server/scripts/windows-vmtools.ps1", "files/win_server/scripts/windows-init.ps1"]
config_files            = ["files/win_server/scripts/windows-vmtools.ps1", "files/win_server/scripts/windows-init.ps1", "files/win_server/scripts/dhcp-ip.ps1", "files/win_server/scripts/winrm-httpv1.ps1", "files/win_server/scripts/winrm-httpsv1.ps1", "files/win_server/scripts/winrm-httpsv2.ps1"]

vsphere_username        = "sandbox-qckg8@demo"
vsphere_datastore       = "workload_share_dwPsq"
vsphere_password        = "eu.iLk-6FLL6"
vsphere_datacenter      = "SDDC-Datacenter"
vsphere_cluster         = "Cluster-1"
vsphere_network         = "segment-sandbox-qckg8"
vsphere_folder          = "Workloads/sandbox-qckg8"