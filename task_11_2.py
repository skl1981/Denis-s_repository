#!/usr/bin/env python2.7

list_of_config=input('Input the list of configs separated by comma')

def parse_cdp_neighbors(command_output):
    for conf in command_output:
        f=open(conf)
        k=f.read().rstrip().split('\n')
        value={}
        local=['0','0']
        remote=['0','0']
        for line in k:
            if '>' in line:
                f1=line.split()[0]
                local[0]=f1[0:3]
            elif line.startswith('R'):
                local[1]='Eth'+line.split()[2]
                interface = tuple(local)
                remote[0]=line.split()[0]
                remote[1]='Eth'+line.split()[-1]
                value[interface]=tuple(remote)
            elif line.startswith('SW'):
                local[1]='Eth'+line.split()[2]
                interface = tuple(local)
                remote[0]=line.split()[0]
                remote[1]='Eth'+line.split()[-1]
                value[interface]=tuple(remote)

        print(value)
        return value
s=parse_cdp_neighbors(list_of_config)
from draw_network_grapf import draw_topology
draw_topology(s)




