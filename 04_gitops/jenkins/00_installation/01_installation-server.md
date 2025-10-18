# Jenkins Server Installation


## Add Jenkins Repo
```shell
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-21-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
```

## Configure Firewalld

```shell
sudo firewall-cmd --add-service=jenkins --zone=public --permanent
sudo firewall-cmd --add-service=http --zone=public --permanent
sudo firewall-cmd --reload
```

## Generate SSH-Key

```shell
ssh-keygen -o -a 100 -t ed25519 -f id_jenkins-srv -C "your-mail"
```

## Start Jenkins

```shell
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

Jenkins https://www.jenkins.io/doc/book/installing/linux/#red-hat-stable


# Worker Node Setup

Install your OS as usual (Using CentOS 10). After the installation is completed,
we should create an user called jenkins, in order to keep everything clean. 

## Create the Jenkins user

```shell
sudo useradd jenkins -m -s /bin/bash
sudo passwd jenkins
```

## Copy controller SSH-Key

Loggin as the Jnekins user: 

```shell
sudo su - jenkins
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "<paste the public key here>" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

Verify acces from your jenkins server:

```shell
ssh jenkins@<worker-node-hostname-or-ip>
```

## Prepare Worker Node Environment

Ensure Java is installed and available:

```shell
sudo yum install java-21-openjdk
```

## Create the Jenkins workspace directory and set ownership:

```shell
sudo mkdir -p /opt/jenkins-agent
sudo chown jenkins:jenkins /opt/jenkins-agent
```

# Configure the node in Jenkins UI

In the Jenkins web interface:

1. Go to: Manage Jenkins → Nodes and Clouds → New Node
2. Choose a name (e.g., worker-1) and select Permanent Agent.
3. Fill in:
    - Remote root directory: /opt/jenkins-agent
    - Labels: (optional, e.g., linux, docker)
    - # of executors: usually 1–2
    - Launch method: “Launch agents via SSH”
4. Under SSH configuration:
    - Host: <worker-node-hostname-or-ip>
    - Credentials: click Add → Jenkins → SSH Username with private key
        - Username: jenkins
        - Private key: choose “Enter directly” and paste your private key from the controller (~/.ssh/id_rsa)

