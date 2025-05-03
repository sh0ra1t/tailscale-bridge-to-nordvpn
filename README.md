# tailscale-bridge-to-nordvpn
Create a Tailscale exit node in Docker with a NordVPN exit node using Wireguard protocol (fastest one).

This project will launch two docker containers. 
- One for Tailscale, and another for NordVPN. 

The Tailscale instance will advertise as an exit node, and use the NordVPN container as an egress route.

## Requirements
* Linux Server (e.g. ubuntu 24.04).

* Aditional packages:
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

## Usage
1. Obtain your Nordvpn API Key
    * Create a API key to allow you access through command line into your NORDVPN account:
    * Info: https://support.nordvpn.com/hc/en-us/articles/20286980309265-How-to-use-a-token-with-NordVPN-on-Linux

2. Obtain your `NORDVPN_AUTHKEY` (token for the exit node)
    * Login into your Nordvpn account: 
    nordvpn login --token <token>
    
    Connect to nordvpn with command: nordvpn connect (don't forget to login with nordvpn login --legacy).
Fetch (your) IP address

After successful connection run

ifconfig nordlynx
Fetch your private key

Run

sudo wg show nordlynx private-key

Output of this command should be something like this:

CKMAE9LARlt2eZHgGnNaSUYiKllKJN7f3hed/bWm5E8=

2. Obtain your `TS_AUTHKEY`
    * Create a API key for your TAILSCALE account:
    * Info: https://tailscale.com/kb/1085/auth-keys#generate-an-auth-key

3. Edit '.env' file and add your credentials:
    * `NORDVPN_AUTHKEY`: Your NordVPN wireguard login token.
    * E.g.: NORDVPN_AUTHKEY=XasnoanoiasnXXXXXXXXXXXXXXXXXX=
    * `TS_AUTHKEY`: Your Tailscale login token.
    * E.g.:TS_AUTHKEY=tskey-auth-XXXXXXXXXX1CNTRL-YYYYYYYYYYYYYYYYYYdsfs

4. Run `docker compose up`.

5. Authorize the exit node on Tailscale.
    * Login into tailscale and manually authorize the exit node on Tailscale.
    * Info: https://tailscale.com/kb/1103/exit-nodes#allow-the-exit-node-from-the-admin-console 

6. Connect one external device to your tailscale and set the exit node with the device `TS_HOSTNAME`. You will obtain the NORDVPN ip.
