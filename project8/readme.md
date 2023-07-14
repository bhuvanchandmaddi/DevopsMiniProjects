# Problem statement
Port-forwarding demo setup. Install nginx on any internal vm(use bridged network, so router thinks it`s just a normal other device on local network).
We have already installed it in project seven, we will use that. Access that application over the internet usinh public ip or dns name

## Pre-requisites
* Vm with nginx installed with default app running on port 80
* Dns name if you want to access that using dns name instead of ip(Buy it from Godaddy or get it for free from other vendors)
* A basic router 

## Implementation details
* Access the nginx app from same node where default application is running and from different node on the same network using internal private just to check the connectivity
* Login to router`s default gateway page. which can be found from **ipconfig** command

* Then create a port-forwading rule, as shown below

* Which means all the traffic, which comes to routers 80 port will be redirected to internal node(where we installed nginx) ip over port 80. 

* So from now on if we access the public ip of the router over port 80. we can reach our application from outside.

**Note:** very very imp: You cannot access the application using public ip from the internal network. Frpm internal network we will use private ip and from other network/internet we will use public ip of the router.This is because the router confuses

**Note:** In some cases, even thought your mobile is in same internal network, you can still access the application over public ip because it may use external dns.

* So if you want to access the application using domain instead of public ip of the router, just create a DNS A record which should point to router`s public ip

**Note:** But the catch here is the public ip of the router changes frequently. So you need to update the dns record every time when public ip of router gets changed by ISP. You can even static public ip for the network but you need to pay little more price for that

**References:**

Special thanks to [powercert animated videos](https://www.youtube.com/watch?v=2G1ueMDgwxw&t=431s) for such a beautiful explanation. Support them.
