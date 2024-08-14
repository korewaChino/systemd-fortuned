# systemd-fortuned socket activation example

This repository contains an example of how to use systemd socket activation for creating systemd socket-activated services.

This specific service implements a simple QoTD (Quote of the Day) server implementing the [RFC 865](https://tools.ietf.org/html/rfc865) protocol
using the `fortune` program.

I created this to learn how to use systemd socket activation and to have a simple example to refer to in the future.

> [!CAUTION] 
> It is not recommended to run an actual RFC 865 server in production in modern times,
> as this protocol can be abused for DDoS attacks. This is just an example.
> If you want to use it in a local network for fun, make sure to firewall it off from the internet.

## How it works

The `fortune@.service` unit is a template that gets instantiated for every incoming connection. It runs `fortune` and has systemd redirect the stdout to the socket.

Then, the `fortune.socket` unit listens on port 17 (the standard QoTD port) and starts the `fortune@.service` unit for every incoming connection,
taking data from the stdout of the service and sending it directly to the client via the socket.

## How to install and run

1. Clone this repository
2. Run `make install` to install the service and socket units
3. Run `systemctl start fortune.socket` to start the service
4. Use a QoTD client to connect to the server (e.g. `nc localhost 17` or `telnet localhost 17`) and you should see a quote