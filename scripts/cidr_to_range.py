#!/usr/bin/env python3

import ipaddress
import sys 
import os

if len(sys.argv) <= 1:
    bn = os.path.basename(sys.argv[0])
    print("usage %s 172.23.0.0/16" % bn)
    exit(0)

ipv4_cidr_range=sys.argv[1]

ip_network = ipaddress.ip_network(ipv4_cidr_range)

base_ip = str(ip_network.network_address)
subnet_mask = ip_network.prefixlen

subnet_mask_dec = 32 - subnet_mask
subnet_mask_hex = hex(subnet_mask_dec)[2:]
subnet_mask_bin = bin(subnet_mask_dec)[2:].zfill(32)
ip_range_start = ip_network.network_address
ip_range_end = ip_network.network_address + (2**subnet_mask_dec - 1)

ip_range_start_str = str(ip_range_start)
ip_range_end_str = str(ip_range_end)
print(f"{ip_range_start_str}-{ip_range_end_str}")
