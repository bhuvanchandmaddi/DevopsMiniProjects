# Problem statement
Write an ansible playbook for installing nginx, docker, logrotate. Ensure nginx container is running on port 8080 on host and log rotation is cleaning the logs of stdout of nginx container once it reaches 100mb. (Separate roles should be created for the tasks mentioned inline)

## Pre-requisites
* vm or ec2-instance with ansible controller setup
* slave nodes/remote machines(you want to manage using ansible) with pre-installed python  

###  Ansible controller setup
* Connect to any linux based system where you want to install ansible controller
* Create a python virtual environment and install pip
* Install ansible using pip module

## Implementation details

Created 3 ansible roles
1. docker - To install docker 
2. nginx - To spinup nginx container
3. logrotate - To rotatelogs of nginx container

 Folder structure of 3 roles:

 ![Folder structure of 3 roles](https://github.com/bhuvanchandmaddi/DevopsMiniProjects/blob/main/.images/roles-filestructure.PNG?raw=true)

 * Created external file **vars/external_vars.yaml** to store all variables
 * docker role execution installs docker in remote(ansible managed machines)
 * nginx role execution creates nginx container & bind mount of docker volume on host machine(Since we will rotate these logs)
 * logrotate role execution installs logrotate and configures it to rotate nginx container logs 
 * config file of logrotate 
 ```
 #cat /etc/logrotate.d/nginx

 /opt/data/nginx_logs/*.log {
        rotate 3
        weekly
        size 100M
        missingok
        compress
        create 0644 nginx nginx
        postrotate
        /bin/kill -USR1 `cat /run/nginx.pid 2>/dev/null` 2>/dev/null || true
         endscript
}
 ```

 **rotate**  Specifies the number of old log files to keep before deleting them. In this case, up to 3 old log files will be kept before they are deleted.

 **weekly**: Specifies the frequency at which the log files are rotated. In this case, the log files will be rotated on a weekly basis.

 **size**: Specifies the maximum size that a log file can reach before it is rotated. In this case, once the log file reaches a size of 100MB, it will be rotated.

**missingok**: Specifies that if a log file is missing, logrotate should not generate an error message. Instead, logrotate will move on to the next log file.

**compress**: Specifies that log files should be compressed using gzip after they are rotated.

**create**: Specifies that logrotate should create a new log file with the given permissions and ownership. In this case, the new log file will have permissions of 0644 and will be owned by the user nginx and group nginx.

**postrotate**: Specifies a command or script that should be executed after the log files are rotated. In this case, the command /bin/kill -USR1 is executed, which sends a USR1 signal to the Nginx process, causing it to reopen its log files and start writing to the newly created log file.
 

## Testing details
* Update the variables in `vars/external_vars.yaml`
* In the playbook, update the hosts section(This is tested in ansible controller node itself by setting it to local host but it is expected to work with remote machine details as well)
* check the syntax of the playbook
```
ansible-playbook playbook.yaml --syntax-check
```
* Execute the playbook now in verbose
```
ansible-playbook playbook.yaml -vv
```

