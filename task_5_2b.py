#!/usr/bin/env python3
from sys import argv
ip_subnet = argv[1]
ip_net=ip_subnet.split('/')
ip_adress=ip_net[0].split('.')
last = bin(int(ip_adress[3]))
last1=8-len(last[2:])
value = '0'*last1+last[2:]
mask=ip_net[1]
k=int(mask)-24
ip_value = value[0:k]+'0'*(32-int(mask))
bin_mask=int(mask)*'1'+'0'*(32-int(mask))
okt1=int(bin_mask[0:8],2)
okt2=int(bin_mask[8:16],2)
okt3=int(bin_mask[16:24],2)
okt4=int(bin_mask[24:],2)
ip_template = '''
Network:
{0:<8}  {1:<8}  {2:<8}  {3:<8}
{0:08b} {1:08b} {2:08b} {3:08b}
'''
mask_template = '''
Mask:
/{0}
{1:<8} {2:<8} {3:<8} {4:<8}
{1:8b} {2:8b} {3:8b} {4:8b}
'''
print(ip_template.format(int(ip_adress[0]),int(ip_adress[1]),int(ip_adress[2]),int(ip_value,2)))
print(mask_template.format(mask,okt1,okt2,okt3,okt4))

