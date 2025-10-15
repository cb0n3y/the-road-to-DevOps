# Prometheus VM (Vagrant)

This Vagrant setup provisions a CentOS 9 Stream virtual machine with Prometheus installed and configured for local monitoring and testing.

## 📦 Requirements

- VirtualBox
- Vagrant
- Internet connection (for package installation)

### ⚠️ Before You Start

Export your password environment variable to avoid exposing secrets:

```bash
export USER_PASSWORD="your_secure_password"
```

## 🚀 Usage

1. Start the VM

```bash
vagrant up
```

2. Stop the VM

```bash
vagrant halt
```

3. Destroy the VM

```bash
vagrant destroy
```

Change to Access Prometheus UI at: http://<your-prometheus-ip>:9090

## 🔧 Configuration

- **OS**: CentOS 9 Stream  
- **Prometheus config path**: /etc/prometheus/  
- **Setup script**: scripts/prom-setup.sh  

## 📁 Folder structure

- **Vagrantfile**: defines VM settings and provisioning  
- **scripts/prom-setup.sh**: installs and configures Prometheus  