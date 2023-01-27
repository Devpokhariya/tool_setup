{
  "variables": {
    "vcenter_username": "",
    "vcenter_password": "",
    "template_name": ""
  },
  "builders": [{
    "type": "vsphere-template",
    "vcenter_server": "vcenter.example.com",
    "username": "{{user `vcenter_username`}}",
    "password": "{{user `vcenter_password`}}",
    "insecure_connection": true,
    "template_folder": "/Datacenter/vm",
    "template_name": "{{user `template_name`}}",
    "vm_name": "Ubuntu_Golden_Image",
    "vm_folder": "/Datacenter/vm",
    "datacenter": "Datacenter",
    "cluster": "Cluster",
    "network_label": "VM Network",
    "resource_pool": "Resources",
    "power_on": true,
    "wait_for_guest_net_timeout": "30m"
  }],
  "provisioners": [{
    "type": "shell",
    "inline": [
      "sleep 30",
      "apt-get update",
      "apt-get -y upgrade",
      "apt-get -y install git"
    ]
  }]
}
