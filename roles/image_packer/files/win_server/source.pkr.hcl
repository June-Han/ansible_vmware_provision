source "vsphere-iso" "win-server-2019-standard-core" {
    // vCenter Server Endpoint Settings and Credentials
    vcenter_server      = var.vsphere_endpoint
    username            = var.vsphere_username
    password            = var.vsphere_password
    insecure_connection = var.vsphere_insecure_connection

    // vSphere Settings
    datacenter                     = var.vsphere_datacenter
    cluster                        = var.vsphere_cluster
    datastore                      = var.vsphere_datastore
    folder                         = var.vsphere_folder

    // Virtual Machine Settings
    vm_name              = var.vm_name_standard_core
    guest_os_type        = var.vm_guest_os_type
    firmware             = var.vm_firmware
    CPUs                 = var.vm_cpu_count
    cpu_cores            = var.vm_cpu_cores
    CPU_hot_plug         = var.vm_cpu_hot_add
    RAM                  = var.vm_mem_size
    RAM_hot_plug         = var.vm_mem_hot_add
    cdrom_type           = var.vm_cdrom_type
    disk_controller_type = var.vm_disk_controller_type
    storage {
    disk_size             = var.vm_disk_size
    disk_thin_provisioned = var.vm_disk_thin_provisioned
    }
    network_adapters {
        network      = var.vsphere_network
        network_card = var.vm_network_card
        mac_address  = var.mac_address
    }
    //iso_paths = [local.iso_paths.datastore, local.iso_paths.tools]
    iso_paths = [var.iso_datastore, var.vmtools_datastore]
    vm_version           = var.common_vm_version
    remove_cdrom         = var.common_remove_cdrom
    reattach_cdroms      = var.vm_cdrom_count
    tools_upgrade_policy = var.common_tools_upgrade_policy

    // Removable Media Settings
    cd_content = {
    "autounattend.xml" = templatefile("${abspath(path.root)}/data/autounattend.pkrtpl.hcl", {
        build_username       = var.build_username
        build_password       = var.build_password
        vm_inst_os_eval      = var.vm_inst_os_eval
        vm_inst_os_language  = var.vm_inst_os_language
        vm_inst_os_keyboard  = var.vm_inst_os_keyboard
        vm_inst_os_image     = var.vm_inst_os_image_standard_core
        vm_guest_os_language = var.vm_guest_os_language
        vm_guest_os_keyboard = var.vm_guest_os_keyboard
        vm_guest_os_timezone = var.vm_guest_os_timezone    
    })
    //"windows-vmtools.ps1" = "${abspath(path.root)}/scripts/windows-vmtools.ps1" //Will carry the local absolute path so Nope
    //"windows-init.ps1" = "${abspath(path.root)}/scripts/windows-init.ps1"
    //"dhcp-ip.ps1" = "${abspath(path.root)}/scripts/dhcp-ip.ps1"
    }

    floppy_files = var.config_files

    // Boot and Provisioning Settings
    boot_order        = var.vm_boot_order
    boot_wait         = var.vm_boot_wait
    //boot_command      = var.vm_boot_command
    ip_wait_timeout   = var.common_ip_wait_timeout
    ip_settle_timeout = var.common_ip_settle_timeout
    shutdown_command  = var.vm_shutdown_command
    shutdown_timeout  = var.common_shutdown_timeout

    // Communicator Settings and Credentials
    communicator   = "winrm"
    winrm_username = var.build_username
    winrm_password = var.build_password
    winrm_port     = var.communicator_port
    winrm_timeout  = var.communicator_timeout
    //winrm_use_ssl = true
    //winrm_insecure = true
}

//locals {
//    iso_paths = {
//        datastore       = "[workload_share_dwPsq] WindowsServer2019.iso"
//        tools           = "[workload_share_dwPsq] vmware_tools_windows/VMware-tools-windows-12.4.5-23787635.iso"
//    }
//}