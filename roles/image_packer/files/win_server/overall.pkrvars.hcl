

// Virtual Machine Guest Operating System Setting
vm_guest_os_type = "windows2019srv_64Guest"

// Virtual Machine Hardware Settings
vm_firmware              = "bios"

//Setting up winrm and vmtools
script_files            = ["scripts/windows-vmtools.ps1", "scripts/windows-init.ps1"]


vsphere_username        = "sandbox-qckg8@demo"
vsphere_datastore       = "workload_share_dwPsq"
vsphere_password        = "eu.iLk-6FLL6"
vsphere_datacenter      = "SDDC-Datacenter"
vsphere_cluster         = "Cluster-1"
vsphere_network         = "segment-sandbox-qckg8"
vsphere_folder          = "Workloads/sandbox-qckg8"