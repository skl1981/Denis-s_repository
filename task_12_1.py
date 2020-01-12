#!/usr/bin/env python2.7

adress=['8.8.8.8','10.1.1.1','192.168.1.23']
def ping_adresses(adresses):
    import subprocess
    avai=[]
    unavai=[]
    final=['0','0']
    for ip in adresses:
        reply = subprocess.run(['ping', '-c', '3', '-n', ip])
        if reply.returncode == 0:
            avai.append(ip)
            print(avai)
        else:
            unavai.append(ip)
            print(unavai)
        
    final[0]=avai
    final[1]=unavai
    print(tuple(final))
    print(type(final))
print(ping_adresses(adress))
