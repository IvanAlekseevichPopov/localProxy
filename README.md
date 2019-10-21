Local proxy server
==========

## Abstract
The point is we start proxy that works through openvpn tunnel:

|                Local area             |     Internet      |
| ------------------------------------- |:-----------------:|
| Browser -> squid -> openvpn client => | => openvpn server |

## Fast start
0. You need `docker` and `docker-compose` installed on your machine
1. Enable ip forwarding on your local host machine(it will affect docker containers also):
    * Temporary(without rebooting the system):

    ```bash
    sysctl -w net.ipv4.ip_forward=1 
    ```
    * Permanent:
    ```bash
    echo "sysctl net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
    ```
2. Put in `vpn/client.ovpn` your vpn client config(there is example `vpn/client.ovpn.dist`)
3. Start docker-compose  by running 
    ```bash
    docker-compose up -d
    ``` 
4. Set proxy setting in your browser to:
 
    |Protocol|    Host   |    Port  |
    | ------ |:---------:|:--------:|
    |  http  | localhost |   3128   |
