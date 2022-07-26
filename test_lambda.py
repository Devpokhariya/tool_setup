#!/usr/bin/env python

# from __future__ import (absolute_import, division, print_function)
# __metaclass__ = type
# from multiprocessing import Pipe, Process
# import json
# import shutil

import ansible.constants as C
# from ansible.executor.task_queue_manager import TaskQueueManager
# from ansible.module_utils.common.collections import ImmutableDict
# from ansible.inventory.manager import InventoryManager
# from ansible.parsing.dataloader import DataLoader
# from ansible.playbook.play import Play
# from ansible.plugins.callback import CallbackBase
# from ansible.vars.manager import VariableManager
# from ansible import context
import yaml
import os

C.DEFAULT_REMOTE_TMP = '/tmp/ansible'
C.DEFAULT_LOCAL_TMP = '/tmp/ansible'
# Create a callback plugin so we can capture the output
import ansible_runner
def lambda_handler(event, context):
    os.system("ls ")
    os.system("mkdir /tmp/demo ")
    os.system("cp -R demo /tmp/demo/")
    os.system("ls /tmp/")
    os.system("ls /tmp/demo")
    os.system("echo 'tmp content above'")
    # os.system("ansible --version")
    r = ansible_runner.run(private_data_dir='/tmp/demo',playbook='test.yml')
    print("{}: {}".format(r.status, r.rc))
    # successful: 0
    for each_host_event in r.events:
        print(each_host_event['event'])
    print("Final status:")
    print(r.stats)


# if __name__ == '__main__':
#     main()
