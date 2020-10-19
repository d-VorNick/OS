#!/bin/bash
vremya=$(date '+d%.%m.%y_%H.%M:%S')
mkdir ~/test && { echo "catalog test was created successully" > ~/report ; touch `/test/$vremya ; }
ping -c1 www.net_nikogo.ru || echo "$vremya ERROR" >> ~/report