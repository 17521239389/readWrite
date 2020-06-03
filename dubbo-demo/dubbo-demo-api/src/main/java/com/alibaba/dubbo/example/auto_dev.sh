#!/bin/bash

ip_info=`ifconfig enp0s3| grep "broadcast" | awk '{print $2}' | cut -d: -f 2`
