source "vmware-iso" "basic-example" {
  iso_url = "http://old-releases.ubuntu.com/releases/precise/ubuntu-12.04.2-server-amd64.iso"
  iso_checksum = "md5:af5f788aee1b32c4b2634734309cc9e9"
  ssh_username = "packer"
  ssh_password = "packer"
  shutdown_command = "shutdown -P now"
  vm_name          = "Golden-Linux-Vm"
  vcenter_cluster  = var.cluster
  vcenter_datacenter = var.datacenter
  username          = var.username
  password          = var.password
  datastore         = var.datastore
  convert_to_template   = true
}

build {
  sources = ["sources.vmware-iso.basic-example"]
}

build {
  sources = [
    "source.vsphere-iso.linux-ubuntu-server"]
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    environment_vars = [
      "BUILD_USERNAME=${var.ssh_username}",
    ]
    scripts = var.shell_scripts
    expect_disconnect = true
  }
 }