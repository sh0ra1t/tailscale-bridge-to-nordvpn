#!/bin/bash

#Insert your nordvpn login api token here.
nordvpn login --token #<TOKEN_HERE>

#Select the country here.
nordvpn connect #<COUNTRY_HERE>

echo "Checking nordlynx connection.."

#Check for interface wireguard 
ifconfig nordlynx

echo "Capturing private-key"

#Capture your private key
sudo wg show nordlynx private-key

# Output of this is your `NORDVPN_AUTHKEY` (example key):
# e.g.: XasnoanoiasnXXXXXXXXXXXXXXXXXX=