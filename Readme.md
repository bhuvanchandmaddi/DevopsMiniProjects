# Devops mini projects

## Project 1
Write an ansible playbook for installing nginx, docker, logrotate. Ensure nginx container is running on port 8080 on host and log rotation is cleaning the logs of stdout of nginx container once it reaches 100mb. (Separate roles should be created for the tasks mentioned inline)

## Project 2 
This project contains helm chart, which is used to deploy nginx application in kubernetes cluster and expose it using NodePot service

## Project 3
Create a Two tier application infrastructure any cloud provider (Preferably in AWS) using Terraform, components that should be included are mentioned below 

VPC  

Security Group 

Subnet (Public and Private) 

NAT (Instance or service) 

EC2 instance  

Terraform should use modules for reusability 

## Project 4
Shell script to take third most CPU & Memory consuming process, this should output to output file with the following properties 

Process Name  

% CPU  used  

% Memory used   

PORT  

PID 

## Project 5

Create a Dockerfile and docker-compose to run a 3 Tier application with backend api(node, python or any sample backend application), database and a nginx server. Mount volumes for persistent data for database Server. 

Configure nginx to enable https 

Redirect http to https 

Create a self signed certificate - document how to do it. 

Whitelist Ip’s 

Any other important configurations 

## Project 6
Setup a python script that connects to remote servers over ssh and does the following: 

Accept commands to be executed on all the remote machines at once 

Wait for the execution to be completed on all the remote machines 

**Note**: In one of my Devops interviews, I`ve received above six projects as case-study. They asked me to solve any 2 out of 6.

## Project 7
Install a sample web application in nginx webserver and map a dummy domain to it by editing hosts file and also trick the browser to accept the self-signed certs by installing dummy root ca certs in browser.

## Project 8
Port-forwarding demo setup. Install nginx on any internal vm(use bridged network, so router thinks it`s just a normal other device on local network).
We have already installed it in project seven, we will use that. Access that application over the internet using public ip or dns name

## Project 9
This is extension of project 7. we have created self signed certicates for accessing nginx application there. Here we will get real certificates from Let`s encrypt for free

**Note**: From project 10, readme info will be available in hashnode. In gitrepo we will gonna see only code snippets,other files etc