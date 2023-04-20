# Ansible Roles
This project connets to remote machines and installs docker. Then provisions a nginx container whose logs are rotated using logrotate.

## Pre-requisites
* vm or ec2-instance with ansible controller setup
* slave nodes/remote machines with pre-installed python ,which you want to manage using ansible 

###  Ansible controller setup
* Connect to the any linux based system where you want to install ansible controller
* Create a python virtual environment and install pip
* Install ansible using pip module

## Implementation details

Created 3 ansible roles
1. docker - To install docker 
2. nginx - To spinup nginx container
3. logrotate - To rotatelogs of nginx container

 Folder structure of 3 roles:

 ![Folder structure of 3 roles](https://example.com/cat.jpg)




