#!/usr/bin/env python3
from sys import argv
mode = input('Input the interface mode ')
interface = input('Input the type and interface number ')
vlan = input('Input the vlan number ')
access_template = [
    'switchport mode access', 'switchport access vlan {}',
    'switchport nonegotiate', 'spanning-tree portfast',
    'spanning-tree bpduguard enable'
]

trunk_template = [
    'switchport trunk encapsulation dot1q', 'switchport mode trunk',
    'switchport trunk allowed vlan {}'
]
k=(mode_template)
print(k)
g='\n'.join(k)
print('Interface {}'.format(interface))
print( g.format(vlan))

