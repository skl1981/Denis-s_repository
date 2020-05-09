#!/usr/bin/env python3
from sys import argv
mode = input('Input the interface mode ')
interface = input('Input the type and interface number ')
vlan = input('Input the vlan number ')
vlans = input('Input the list of vlans ')
access_template = [
    'switchport mode access', 'switchport access vlan {}',
    'switchport nonegotiate', 'spanning-tree portfast',
    'spanning-tree bpduguard enable'
]

trunk_template = [
    'switchport trunk encapsulation dot1q', 'switchport mode trunk',
    'switchport trunk allowed vlan {}'
]

result = {'access':access_template, 'trunk':trunk_template}
g='\n'.join(result[mode])
print('Interface {}'.format(interface))
print( g.format(vlan))

