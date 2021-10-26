#!/usr/bin/env python

#print(json.load(sys.stdin)[1]['network_interfaces'][0]['primary_v4_address']['one_to_one_nat']['address'])"
import os
import sys
import argparse
import json

# try:

# except ImportError:
#     import simplejson as json

class ExampleInventory(object):

    def __init__(self):
        self.inventory = {}
        self.srcdump = {}
        self.read_cli_args()

        # Called with `--list`.
        if self.args.list:
            self.inventory = self.example_inventory()
        # Called with `--host [hostname]`.
        elif self.args.host:
            # Not implemented, since we return _meta info `--list`.
            self.inventory = self.empty_inventory()
        # If no groups or vars are present, return an empty inventory.
        else:
            self.inventory = self.empty_inventory()

        print(json.dumps(self.inventory));

    # Example inventory for testing.
    def example_inventory(self):
        hosts = []
        self.srcdump = json.loads(os.popen('yc compute instance list --format json').read())
        #print(self.srcdump)

        for instance in self.srcdump:
  #          print(instance)
  #          print("=========")
  #          hosts.append(instance['network_interfaces'][0]['primary_v4_address']['one_to_one_nat']['address'])
            if 'app' in instance['name']:
                apphost = instance['network_interfaces'][0]['primary_v4_address']['one_to_one_nat']['address']
            if 'db' in instance['name']:
                dbhost = instance['network_interfaces'][0]['primary_v4_address']['one_to_one_nat']['address']

        return {
            'all': {
                'hosts': hosts
                },
            'app': {
                'hosts': [apphost]
            },
            'db': {
                'hosts': [dbhost]
            }
            }

    # Empty inventory for testing.
    def empty_inventory(self):
        return {'_meta': {'hostvars': {}}}

    # Read the command line args passed to the script.
    def read_cli_args(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('--list', action = 'store_true')
        parser.add_argument('--host', action = 'store')
        self.args = parser.parse_args()

# Get the inventory.
ExampleInventory()
