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
      "vm_name": "Golden-Windows-AMI",
      "guest_os_type": "windows9Server64Guest",
      "headless": true,
      "shutdown_command": "shutdown /s /t 10 /f /d p:4:1",
      "config_template": "config_template.json"
    }
  ],
  "provisioners": [
    {
      "type": "powershell",
      "inline": [
        "Add-WindowsFeature Web-Server",
        "Add-WindowsFeature Web-Mgmt-Tools"
      ]
    }
  ]
}
