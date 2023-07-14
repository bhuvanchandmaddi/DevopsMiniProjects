# problem statement

This is extension of project 7. we have created self signed certicates for accessing nginx application there. Here we will get real certificates from Let`s encrypt for free

## Pre-requisites

* Install nginx in a vm and do the config setup done in project 7
* Go and get a domain(I`ve bought it from Godaddy). you can even get free domains for other vendors.
* If the node where you installed nginx has public ip then directly create a DNS A record to point to your public ip.
* If no, then create a port-forwading rule to 443. i.e created a dns A record which points to public ip of router and the create a port-forwading rule to direct all the traffic to router on 443 to internal node port 443

![Image](https://github.com/bhuvanchandmaddi/DevopsMiniProjects/blob/main/.images/https-portforward.jpg?raw=true)

## Implementation details
* Installed required packages
```
# If you have python2 then python3-certbot-nginx
# In debian based machines also same package names replace yum with apt
# for apache it will be python3-certbot-apache
yum install certbot python3-certbot-nginx
```
* Then execute below cmd so that cert bort will initiate http01 challenge and will create cert for your domain and private key and it even updated the nginx config file
```
sudo certbot --nginx -d <domain-name>
```
* Here the challange is very important. The domain should resolve to the ip of your machine. As we discussed in Pre-requisites if you have public ip then it is fine else use port-forward

**Note**: As we know we cannot access the applicatopn over https from the machines which are in same internal network(Due to port-forwarding, refer project 8 for more info).

* Test connectivity from mobile network/hotspot  or using mobile phone(It may use external dns some times)