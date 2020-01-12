#!/usr/bin/env python2.7

adress=['8.8.4.4', '1.1.1.1-3', '172.21.41.128-172.21.41.132']
def ping_adresses(adresses):
    import subprocess
    import ipaddress
    final=[]
    final1=[]
    final2=[]

    for ip in adresses:
        try:
            ipaddress.ip_address(ip)
            final.append(ip)
            print(final)
        except ValueError:
            ip=ip.split('-')
            if ip[1].isdigit():
                k=int(ip[1])
                ip1=ipaddress.ip_address(ip[0])
                n=1
                while n<=k:
                    final1.append(ip1)
                    ip1=ip1+1
                    n=n+1
                    print(final1)
            else:
                newip1=ipaddress.ip_address(ip[0])
                print(newip1)
                ehost=ip[1].split('.')
                ehost1=int(ehost[3])
                print(ehost1)
                host=ip[0].split('.')
                host1=int(host[3])
                
                while host1<ehost1:
                    final2.append(newip1)
                    newip1=newip1+1
                    host1=host1+1
                    print(final2)
    result=final+final1+final2


            
            
print(ping_adresses(adress))
        
    
