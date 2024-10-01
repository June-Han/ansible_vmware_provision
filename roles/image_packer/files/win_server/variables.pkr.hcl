variable "vsphere_endpoint" {
  type        = string
  default     = "vcsnsx-vc.infra.demo.redhat.com"
  description = "The fully qualified domain name or IP address of the vCenter Server instance."
}

variable "vsphere_username" {
  type        = string
  description = "The username to login to the vCenter Server instance."
  sensitive   = true
}

variable "vsphere_password" {
  type        = string
  description = "The password for the login to the vCenter Server instance."
  sensitive   = true
}

variable "vsphere_insecure_connection" {
  type        = bool
  default     = true
  description = "Do not validate vCenter Server TLS certificate."
}

// vSphere Settings

variable "vsphere_datacenter" {
  type        = string
  description = "The name of the target vSphere datacenter."
}

variable "vsphere_cluster" {
  type        = string
  description = "The name of the target vSphere cluster."
}

variable "vsphere_datastore" {
  type        = string
  description = "The name of the target vSphere datastore."
}

variable "vsphere_network" {
  type        = string
  description = "The name of the target vSphere network segment."
}

variable "vsphere_folder" {
  type        = string
  description = "The name of the target vSphere folder."
}

// Installer Settings

variable "vm_inst_os_language" {
  type        = string
  description = "The installation operating system lanugage."
  default     = "en-US"
}

variable "vm_inst_os_keyboard" {
  type        = string
  description = "The installation operating system keyboard input."
  default     = "en-US"
}

variable "vm_inst_os_eval" {
  type        = bool
  description = "Build using the operating system evaluation"
  default     = true
}

variable "vm_inst_os_image_standard_core" {
  type        = string
  description = "The installation operating system image input for Microsoft Windows Standard Core."
  default     = "Windows Server 2019 SERVERSTANDARDCORE"
}

// Virtual Machine Settings

variable "vm_name_standard_core" {
  type        = string
  description = "Name of the vm"
  default     = "WindowsServer2019Packer"
}

variable "vm_guest_os_language" {
  type        = string
  description = "The guest operating system lanugage."
  default     = "en-US"
}

variable "vm_guest_os_keyboard" {
  type        = string
  description = "The guest operating system keyboard input."
  default     = "en-US"
}

variable "vm_guest_os_timezone" {
  type        = string
  description = "The guest operating system timezone."
  default     = "UTC"
}

variable "vm_guest_os_family" {
  type        = string
  description = "The guest operating system family. Used for naming and VMware Tools."
  default     = "windows"
}

variable "vm_guest_os_name" {
  type        = string
  description = "The guest operating system name. Used for naming."
  default     = "server"
}

variable "vm_guest_os_version" {
  type        = string
  description = "The guest operating system version. Used for naming."
  default     = "2019"
}

variable "vm_guest_os_experience_core" {
  type        = string
  description = "The guest operating system minimal experience. Used for naming."
  default     = "core"
}

variable "vm_guest_os_type" {
  type        = string
  description = "The guest operating system type, also know as guestid."
  default     = "windows2019srv_64Guest"
}

variable "vm_firmware" {
  type        = string
  description = "The virtual machine firmware."
  default     = "efi-secure"
}

variable "vm_cdrom_type" {
  type        = string
  description = "The virtual machine CD-ROM type."
  default     = "sata"
}

variable "vm_cdrom_count" {
  type        = string
  description = "The number of virtual CD-ROMs remaining after the build."
  default     = 1
}

variable "vm_cpu_count" {
  type        = number
  description = "The number of virtual CPUs."
  default     = 2
}

variable "vm_cpu_cores" {
  type        = number
  description = "The number of virtual CPUs cores per socket."
  default     = 1
}

variable "vm_cpu_hot_add" {
  type        = bool
  description = "Enable hot add CPU."
  default     = false
}

variable "vm_mem_size" {
  type        = number
  description = "The size for the virtual memory in MB."
  default     = 4096
}

variable "vm_mem_hot_add" {
  type        = bool
  description = "Enable hot add memory."
  default     = false
}

variable "vm_disk_size" {
  type        = number
  description = "The size for the virtual disk in MB."
  default     = 102400
}

variable "vm_disk_controller_type" {
  type        = list(string)
  description = "The virtual disk controller types in sequence."
  default     = ["pvscsi"]
}

variable "vm_disk_thin_provisioned" {
  type        = bool
  description = "Thin provision the virtual disk."
  default     = true
}

variable "vm_network_card" {
  type        = string
  description = "The virtual network card type."
  default     = "vmxnet3"
}

variable "mac_address" {
  type        = string
  description = "The VM mac address."
  default     = "00:50:56:83:3a:5d"
}

variable "common_vm_version" {
  type        = number
  description = "The vSphere virtual hardware version."
  default     = "17"
}

variable "common_tools_upgrade_policy" {
  type        = bool
  description = "Upgrade VMware Tools on reboot."
  default     = true
}

variable "common_remove_cdrom" {
  type        = bool
  description = "Remove the virtual CD-ROM(s)."
  default     = true
}

// Template and Content Library Settings

variable "common_template_conversion" {
  type        = bool
  description = "Convert the virtual machine to template. Must be 'false' for content library."
  default     = false
}

variable "common_content_library_enabled" {
  type        = bool
  description = "Import the virtual machine into the vSphere content library."
  default     = true
}

variable "common_content_library" {
  type        = string
  description = "The name of the target vSphere content library, if enabled."
  default     = null
}

variable "common_content_library_ovf" {
  type        = bool
  description = "Export to content library as an OVF template."
  default     = true
}

variable "common_content_library_destroy" {
  type        = bool
  description = "Delete the virtual machine after exporting to the content library."
  default     = true
}

variable "common_content_library_skip_export" {
  type        = bool
  description = "Skip exporting the virtual machine to the content library. Option allows for testing/debugging without saving the machine image."
  default     = false
}

// OVF Export Settings

variable "common_ovf_export_enabled" {
  type        = bool
  description = "Enable OVF artifact export."
  default     = false
}

variable "common_ovf_export_overwrite" {
  type        = bool
  description = "Overwrite existing OVF artifact."
  default     = true
}

// Removable Media Settings

variable "common_iso_content_library_enabled" {
  type        = bool
  description = "Import the guest operating system ISO into the vSphere content library."
  default     = false
}

variable "common_iso_content_library" {
  type        = string
  description = "The name of the target vSphere content library for the guest operating system ISO."
  default     = ""
}

variable "common_iso_datastore" {
  type        = string
  description = "The name of the target vSphere datastore for the guest operating system ISO."
  default     = ""
}

variable "iso_content_library_item" {
  type        = string
  description = "The vSphere content library item name for the guest operating system ISO."
  default     = ""
}

// Boot Settings

variable "common_http_ip" {
  type        = string
  description = "Define an IP address on the host to use for the HTTP server."
  default     = null
}

variable "vm_boot_order" {
  type        = string
  description = "The boot order for virtual machines devices."
  default     = "disk,cdrom"
}

variable "vm_boot_wait" {
  type        = string
  description = "The time to wait before boot."
  default     = "2s"
}

//variable "vm_boot_command" {
//  type        = list(string)
//  description = "The virtual machine boot command."
//  default     = ["<spacebar>"]
//}

variable "vm_shutdown_command" {
  type        = string
  description = "Command(s) for guest operating system shutdown."
  default     = "shutdown /s /t 10 /f /d p:4:1 /c \"Shutdown by Packer\""
}

variable "common_ip_wait_timeout" {
  type        = string
  description = "Time to wait for guest operating system IP address response."
  default     = "30m"
}

variable "common_ip_settle_timeout" {
  type        = string
  description = "Time to wait for guest operating system IP to settle down."
  default     = "5s"
}

variable "common_shutdown_timeout" {
  type        = string
  description = "Time to wait for guest operating system shutdown."
  default     = "2m"
}

// Communicator Settings and Credentials

variable "build_username" {
  type        = string
  description = "The username to login to the guest operating system."
  sensitive   = true
  default     = "redhat"
}

variable "build_password" {
  type        = string
  description = "The password to login to the guest operating system."
  sensitive   = true
  default     = "redhat123!"
}

variable "build_password_encrypted" {
  type        = string
  description = "The SHA-512 encrypted password to login to the guest operating system."
  sensitive   = true
  default     = ""
}

variable "build_key" {
  type        = string
  description = "The public key to login to the guest operating system."
  sensitive   = true
  default     = ""
}

// Communicator Credentials

variable "communicator_port" {
  type        = number
  description = "The port for the communicator protocol."
  default     = 5985
}

variable "communicator_timeout" {
  type        = string
  description = "The timeout for the communicator protocol."
  default     = "12h"
}

// Provisioner Settings

variable "script_files" {
  type    = list(string)
  description = "Specify all files and folders that need to be made available AFTER the OS install"
}