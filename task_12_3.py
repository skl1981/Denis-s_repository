#!/usr/bin/env python2.7

adress_avai=['8.8.8.8','10.1.1.1','192.168.1.23']
adress_unavai=['123.3.3.4','33.4.5.6','45.7.8.3']
def check_adresses(avai,unavai):
    from tabulate import tabulate
    final = [['8.8.8.8','123.3.3.4'],['10.1.1.1','33.4.5.6'],['192.168.1.23','45.7.8.3']]
    final1=list(zip(avai,unavai))
    columns=['reachable','unreachable']
    print(tabulate(final1,headers=columns,tablefmt="grid"))
    
print(check_adresses(adress_avai,adress_unavai))
