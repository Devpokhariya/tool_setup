{
  "builders": [
    {
      "type": "vsphere-iso",
      "vcenter_server": "vcenter.example.com",
      "username": "admin",
      "password": "password",
      "insecure_connection": true,
      "datacenter": "Datacenter",
      "cluster": "Cluster",
      "datastore": "Datastore",
      "network": "Network",
      "template_path": "path/to/template",
      "vm_name": "Golden-Linux-AMI",
      "guest_os_type": "ubuntu64Guest",
      "headless": true,
      "ssh_username": "root",
      "ssh_password": "password",
      "ssh_timeout": "10m",
      "shutdown_command": "shutdown -P now",
      "config_template": "config_template.json"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "apt-get update",
        "apt-get install -y software1 software2"
      ]
    }
  ]
}
