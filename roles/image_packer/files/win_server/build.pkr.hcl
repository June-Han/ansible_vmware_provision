build {
  sources = [
    "source.vsphere-iso.win-server-2019-standard-core",
  ]

  provisioner "powershell" {
    scripts           = var.script_files
  }
}