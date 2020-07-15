#!/bin/bash
for i in {1..600}
do
   LAT=$(qperf -vvu -m 8k 172.16.0.1 -t 1 udp_lat | grep latency) && LAT="${LAT//" "}" && LAT="${LAT//"latency="}"
   echo $LAT >> 2nucs_bm_latps_ul.txt;
   sleep 1;
done

