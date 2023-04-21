import paramiko

# list of remote servers to connect
remote_servers = ["172.31.30.213", "172.31.26.108"]

# create a new SSH key pair (if you don't already have one)
# ssh-keygen -t rsa -b 4096

# load the private key
private_key = paramiko.RSAKey.from_private_key_file('/tmp/sample_key.pem')

# establish SSH connection with each remote server
ssh_clients = []
for server in remote_servers:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(server, username="ec2-user", pkey=private_key)
    ssh_clients.append(ssh)

# accept input until the user types "exit"
while True:
    command = input("Enter command to execute on remote servers: ")
    if command == "exit":
        break

    # execute command on each remote server
    for ssh in ssh_clients:
        stdin, stdout, stderr = ssh.exec_command(command)
        # wait for the command to complete
        stdout.channel.recv_exit_status()

    print("Command execution completed on all servers.")
