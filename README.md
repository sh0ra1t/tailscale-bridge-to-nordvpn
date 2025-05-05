# tailscale-bridge-to-nordvpn

This project will launch two docker containers. 
- One for Tailscale, and another for NordVPN. 

The Tailscale instance will advertise as an exit node, and use the NordVPN container as an egress route.

## Requirements
* Linux Server (e.g. ubuntu 24.04).

* Aditional packages:
    * wireguard
    * docker-ce
    * docker-ce-cli 
    * containerd.io 
    * docker-buildx-plugin
    * docker-compose-plugin
 
 
* NordVPN account.

## Features
* Connect to any NordVPN region.
* Tailscale container is only launched after healthcheck of Nordvpn container.
* Define your tokens on .env file.
* Obtain your Nordvpn wireguard private key

## Usage
1. Obtain your Nordvpn Login API Token:
    * Create a API key to allow you access through command line into your NORDVPN account:
    * Info: https://support.nordvpn.com/hc/en-us/articles/20286980309265-How-to-use-a-token-with-NordVPN-on-Linux

2. Obtain your `NORDVPN_AUTHKEY` (wireguard private key):
    * Execute nordvpn_token.sh 
    
3. Obtain your `TS_AUTHKEY`
    * Create a API key for your TAILSCALE account:
    * When creating the key on Tailscale, add the device tick the options "Use as exit node" and "Reusable" so you can use it again if needed.
    * More info: https://tailscale.com/kb/1085/auth-keys#generate-an-auth-key


3. Edit '.env' file and add your credentials:
    * `NORDVPN_AUTHKEY`: Your NordVPN wireguard login token.
    * E.g.: NORDVPN_AUTHKEY=XasnoanoiasnXXXXXXXXXXXXXXXXXX=
    * `TS_AUTHKEY`: Your Tailscale login token.
    * E.g.:TS_AUTHKEY=tskey-auth-XXXXXXXXXX1CNTRL-YYYYYYYYYYYYYYYYYYdsfs

4. Run `docker-compose up`.

5. Authorize the exit node on Tailscale.
    * Manually authorize the exit node on Tailscale.
    * Select the machine, click on (...), "Edit Route Settings" and apply "Use as exit node".
    * More info: https://tailscale.com/kb/1103/exit-nodes#allow-the-exit-node-from-the-admin-console 

6. Connect one external device to your tailscale and set the exit node with the device `TS_HOSTNAME`. You will obtain the NORDVPN ip.
