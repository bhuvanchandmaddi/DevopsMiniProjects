# Problem statement
Install a sample web application in nginx webserver and map a dummy domain to it by editing hosts file and also trick the browser to accept the certs by installing dummy root ca certs in browser.

## Pre-requisites
* centos 7 machine(This will work with other linux distros)
* No domain name is needed, we will fake it by editing hosts file

Note: same demo on ubuntu mamchine [steps](https://github.com/christianlempa/videos/tree/main/nginx-reverseproxy)


##Implementation details

* Install nginx from epel repo
```
yum install epel-release # Ignore if this repo already exists
yum install nginx -y
```

* Nginx config file can be found at **/etc/nginx/nginx.conf**
```
  server {
        listen       80;
        listen       [::]:80;
        server_name  ;
        root         /usr/share/nginx/html;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
    }
```
* update the server name property to a domain name. In my case I am using **bmaddi-devops.com** fake domain

* update the **/etc/hosts** file, map the domain to localhost
```
nano /etc/hosts
127.0.0.1 bmaddi-devops.com
```
* Access the application using dummy doamin name using curl or web browser
```
curl http://bmaddi-devops.com
```
* You could see not secure error, if you access the site using web-browser.So we will get self-signed certificates for the dummy domain. For exact steps, refer to [article](https://devopscube.com/create-self-signed-certificates-openssl/)

Note: We cannot obtain real-ssl certificates from let`s encrypt or other CA providers because we need a real domain to do that. Which we will see in project 8

* Create self-signed ssl-certs using the bash-script. pass the domain name as argument to the script. The script will create all the certificates and keys we created using the individual commands. The SSL certificate and private keys get named with the domain name you pass as the script argument. For example, bmaddi-devops.com.key & bmaddi-devops.com.crt
```
chmod +x script.sh
./script.sh bmaddi-devops.com
```
* Import the rootCA.crt file to the web-browsers certificates list, to trick web browser

* Update the nginx configuration with ssl cert details as shown below
```
   server {
       listen       443 ssl http2;
       listen       [::]:443 ssl http2;
       server_name  bmaddi-devops.com;
       root         /usr/share/nginx/html;

       ssl_certificate "location of cert file  i.e bmaddi-devops.com.crt";
       ssl_certificate_key "location of private key file i.e bmaddi-devops.com.key";
       ssl_session_cache shared:SSL:1m;
       ssl_session_timeout  10m;
       ssl_ciphers HIGH:!aNULL:!MD5;
       ssl_prefer_server_ciphers on;

       # Load configuration files for the default server block.
       include /etc/nginx/default.d/*.conf;

       error_page 404 /404.html;
           location = /40x.html {
       }

       error_page 500 502 503 504 /50x.html;
           location = /50x.html {
       }
   }
```
* Now relaod and access the application over https
```
nginx -s reload
curl -k https://bmaddi-devops.com
or using web-browser
```