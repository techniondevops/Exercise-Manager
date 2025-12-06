# Exercise Manager - DevOps Final Project

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://hub.docker.com/r/mordo12/exercise-manager)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)](https://aws.amazon.com/)

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Personal Details](#personal-details)
3. [Key Features](#key-features)
4. [Architecture](#architecture)
5. [Tech Stack](#tech-stack)
6. [Prerequisites](#prerequisites)
7. [Project Structure](#project-structure)
8. [Deployment Guide](#deployment-guide)
9. [CI/CD Pipeline](#cicd-pipeline)
10. [Testing](#testing)
11. [Troubleshooting](#troubleshooting)
12. [Application Usage](#application-usage)
13. [License](#license)

---

## 🎯 Project Overview

**Exercise Manager** is a comprehensive fitness tracking web application deployed on a highly available Kubernetes cluster in AWS. The application allows users to:

- 📊 Track workout exercises with duration and calories burned
- 💪 Calculate BMI and receive personalized fitness recommendations
- 📁 Store data persistently using NFS-backed storage
- 🌐 Access through a load-balanced, highly available infrastructure

### What Makes This Project Special:

- **Full DevOps Implementation**: Complete CI/CD pipeline with automated testing, building, and deployment
- **Infrastructure as Code**: All infrastructure defined in Terraform and configured with Ansible
- **High Availability**: Multi-node Kubernetes cluster with load balancing
- **Persistent Storage**: NFS server ensures data survives pod restarts
- **Production-Ready**: Health checks, monitoring, and automated deployments

---

## 👤 Personal Details

- **Name**: [Your Name]
- **ID**: [Your ID]
- **GitHub**: https://github.com/Mordonlan/FINAL-Exercise-Manager
- **Docker Hub**: https://hub.docker.com/r/mordo12/exercise-manager

---

## ✨ Key Features

### Application Features:
- ✅ Add, edit, and remove exercises
- ✅ Track duration and calories for each exercise
- ✅ Calculate BMI based on height and weight
- ✅ View exercise statistics and totals
- ✅ Dummy data preloaded for demonstration
- ✅ Responsive web interface

### DevOps Features:
- 🚀 **Automated CI/CD**: GitHub Actions pipeline
- ☸️ **Kubernetes Orchestration**: 3-node cluster (1 master + 2 workers)
- 📦 **Docker Containerization**: Multi-stage builds, health checks
- 🏗️ **Infrastructure as Code**: Terraform + Ansible
- ⚖️ **Load Balancing**: AWS Application Load Balancer
- 💾 **Persistent Storage**: NFS shared storage
- 🔍 **Health Monitoring**: Automated health checks
- 📊 **High Availability**: Multiple replicas across worker nodes

---

## 🏗️ Architecture

### High-Level Architecture

```
                    🌐 Internet
                        ↓
         ⚖️ Application Load Balancer (ALB) :80
                        ↓
              🎯 Target Group :30080
                        ↓
    ┌───────────────────┴───────────────────┐
    ↓                                       ↓
🖥️ Worker 1 (EC2)                    🖥️ Worker 2 (EC2)
  📦 Pod 1 (App)                       📦 Pod 2 (App)
  📦 Pod 2 (App)                       📦 Pod 3 (App)
    ↓                                       ↓
    └───────────────────┬───────────────────┘
                        ↓
           💾 NFS Server (Master Node)
              /srv/nfs/kubedata
                 exercises.json
                        ↑
                        |
            🎮 Master Node (EC2)
               Kubernetes API
               NFS Server
```

### Data Flow:

1. **User Request** → ALB receives HTTP request on port 80
2. **Load Balancing** → ALB routes to healthy worker node (port 30080)
3. **Kubernetes Service** → NodePort service routes to application pod
4. **Application Pod** → Flask app processes request
5. **Data Access** → App reads/writes JSON from NFS mount
6. **Response** → Data sent back through the chain

---

## 🛠️ Tech Stack

### Application:
- **Backend**: Flask 3.0.0 (Python)
- **Web Server**: Gunicorn
- **Frontend**: HTML + Bootstrap
- **Data**: JSON files on NFS

### Infrastructure:
- **Cloud**: AWS (EC2, VPC, ALB, Security Groups)
- **IaC**: Terraform
- **Configuration Management**: Ansible
- **Orchestration**: Kubernetes
- **Package Management**: Helm
- **CI/CD**: GitHub Actions
- **Containerization**: Docker

---

## 📦 Prerequisites

### Required Tools:

1. **Terraform** >= 1.5.0
   ```bash
   # Install on Linux/macOS
   wget https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
   unzip terraform_1.5.0_linux_amd64.zip
   sudo mv terraform /usr/local/bin/
   ```

2. **Ansible** >= 2.14
   ```bash
   pip install ansible
   ```

3. **Docker**
   ```bash
   # Linux
   curl -fsSL https://get.docker.com | sh
   ```

4. **kubectl**
   ```bash
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   ```

5. **Helm** >= 3.0
   ```bash
   curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   ```

6. **AWS CLI**
   ```bash
   pip install awscli
   ```

### AWS Account Requirements:
- AWS Account (AWS Academy/Learner Lab or regular AWS)
- AWS Access Key ID
- AWS Secret Access Key
- AWS Session Token (if using AWS Academy)

---

## 📁 Project Structure

```
FINAL-Exercise-Manager/
├── .github/
│   └── workflows/
│       └── deploy.yml                 # CI/CD pipeline
├── ansible/
│   ├── playbook.yml                   # Kubernetes setup
│   ├── docker-deploy.yml              # Docker deployment
│   └── ansible.cfg                    # Ansible configuration
├── terraform/
│   ├── main.tf                        # Main infrastructure
│   ├── variables.tf                   # Variables
│   ├── outputs.tf                     # Outputs
│   ├── inventory.tpl                  # Ansible inventory template
│   └── terraform.tfvars.example       # Example variables
├── python - app/
│   ├── app.py                         # Flask application
│   ├── Dockerfile                     # Container definition
│   ├── requirements.txt               # Python dependencies
│   └── templates/
│       └── home.html                  # Web interface
├── helm/
│   └── exercise-manager/
│       ├── Chart.yaml                 # Helm chart metadata
│       ├── values.yaml                # Configuration values
│       └── templates/
│           ├── deployment.yaml
│           └── service.yaml
├── .gitignore                         # Git ignore rules
├── README.md                          # This file
└── USER_GUIDE.md                      # Application user guide
```

---

## 🚀 Deployment Guide

### Step 1: Clone the Repository

```bash
git clone https://github.com/Mordonlan/FINAL-Exercise-Manager.git
cd FINAL-Exercise-Manager
```

### Step 2: Configure AWS Credentials

#### Option A: AWS CLI
```bash
aws configure
# Enter AWS Access Key ID
# Enter AWS Secret Access Key
# Region: us-east-1
# Output format: json
```

#### Option B: Environment Variables
```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_SESSION_TOKEN="your-session-token"  # If using AWS Academy
```

### Step 3: Generate SSH Key

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/exercise_manager_key
```

### Step 4: Configure Terraform

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars

# Edit terraform.tfvars
nano terraform.tfvars
```

**terraform.tfvars:**
```hcl
aws_region      = "us-east-1"
instance_type   = "t3.medium"
key_name        = "exercise-manager-key"
public_key_path = "~/.ssh/exercise_manager_key.pub"
```

### Step 5: Deploy Infrastructure

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

**Save the outputs:**
```bash
terraform output
# Note down: master_public_ip, load_balancer_dns, master_private_ip
```

### Step 6: Update Ansible Inventory

```bash
cd ../ansible
nano inventory.ini
```

**Update with your IPs:**
```ini
[master]
k8s-master ansible_host=<MASTER_PUBLIC_IP> ansible_user=ubuntu private_ip=<MASTER_PRIVATE_IP>

[workers]
worker-1 ansible_host=<WORKER1_PUBLIC_IP> ansible_user=ubuntu
worker-2 ansible_host=<WORKER2_PUBLIC_IP> ansible_user=ubuntu

[k8s:children]
master
workers

[k8s:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_ssh_private_key_file=~/.ssh/exercise_manager_key
```

### Step 7: Deploy Application

```bash
ansible-playbook -i inventory.ini docker-deploy.yml --private-key ~/.ssh/exercise_manager_key
```

### Step 8: Access the Application

```
http://<LOAD_BALANCER_DNS>
```

---

## 🔄 CI/CD Pipeline

The GitHub Actions pipeline automates the entire deployment process:

### Pipeline Stages:

1. **Test** (2 minutes)
   - Runs pytest unit tests
   - Validates Python code

2. **Build & Push** (3 minutes)
   - Builds Docker image
   - Pushes to Docker Hub
   - Tags with commit SHA

3. **Provision Infrastructure** (10 minutes)
   - Runs Terraform
   - Creates EC2 instances
   - Sets up networking
   - Configures security groups

4. **Configure Cluster** (20 minutes)
   - Runs Ansible playbooks
   - Installs Kubernetes
   - Sets up NFS server
   - Joins worker nodes

5. **Deploy Application** (5 minutes)
   - Deploys with Docker on nodes
   - Configures load balancing
   - Performs health checks

### Trigger the Pipeline:

```bash
git add .
git commit -m "Deploy application"
git push origin main
```

### Required GitHub Secrets:

Go to repository Settings → Secrets → Actions:

1. `DOCKERHUB_USERNAME` - Your Docker Hub username
2. `DOCKERHUB_TOKEN` - Docker Hub access token
3. `AWS_ACCESS_KEY_ID` - AWS access key
4. `AWS_SECRET_ACCESS_KEY` - AWS secret key
5. `AWS_SESSION_TOKEN` - AWS session token (if using Academy)
6. `SSH_PRIVATE_KEY` - Contents of `~/.ssh/exercise_manager_key`

---

## 🧪 Testing

### Health Check

```bash
curl http://<LOAD_BALANCER_DNS>/health
```

**Expected response:**
```json
{
  "status": "healthy",
  "timestamp": "2025-12-06T...",
  "data_file": "/data/exercises.json",
  "data_file_exists": true
}
```

### API Endpoints

```bash
# Get all exercises
curl http://<LOAD_BALANCER_DNS>/api/exercises

# Add exercise
curl -X POST http://<LOAD_BALANCER_DNS>/api/exercises \
  -H "Content-Type: application/json" \
  -d '{"name":"Yoga","duration":30,"calories":150}'
```

### Verify Kubernetes

```bash
# SSH to master
ssh -i ~/.ssh/exercise_manager_key ubuntu@<MASTER_IP>

# Check nodes
kubectl get nodes

# Check pods
kubectl get pods

# Check services
kubectl get svc

# View logs
docker logs exercise-manager
```

---

## 🔧 Troubleshooting

### Issue: 502 Bad Gateway

**Cause**: Application not responding or Load Balancer misconfigured

**Solution**:
```bash
# Check container status
ssh -i ~/.ssh/exercise_manager_key ubuntu@<WORKER_IP>
docker ps
docker logs exercise-manager

# Check Target Group health in AWS Console
# EC2 → Target Groups → exercise-manager-tg → Targets
```

### Issue: Cannot SSH to instances

**Cause**: Security Group not allowing SSH

**Solution**:
- Go to AWS Console → EC2 → Security Groups
- Find `exercise-manager-ec2-sg`
- Edit Inbound Rules → Add SSH (port 22) from 0.0.0.0/0

### Issue: Terraform apply fails

**Cause**: Invalid AWS credentials

**Solution**:
```bash
# Refresh credentials
aws sts get-caller-identity

# If using AWS Academy, get new credentials from AWS Details
```

---

## 📖 Application Usage

See [USER_GUIDE.md](USER_GUIDE.md) for detailed application usage instructions.

### Quick Start:

1. **Add Exercise**:
   - Enter exercise name, duration (minutes), calories
   - Click "Add Exercise"

2. **View Statistics**:
   - See total exercises, minutes, and calories on homepage

3. **Calculate BMI**:
   - Enter weight (kg) and height (cm)
   - Get personalized calorie burn recommendations

4. **Remove Exercise**:
   - Click "Remove" button next to any exercise

---

## 🧹 Cleanup

### Destroy all resources:

```bash
cd terraform
terraform destroy -auto-approve
```

**Warning**: This will delete all AWS resources!

---

## 📝 License

This project is for educational purposes as part of the DevOps course final project.

---

## 👨‍💻 Author

**Mordo12**  
GitHub: [@Mordonlan](https://github.com/Mordonlan)  
Docker Hub: [mordo12](https://hub.docker.com/u/mordo12)

---

## 📚 Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Kubernetes Documentation](https://kubernetes.io/docs)
- [Ansible Documentation](https://docs.ansible.com)
- [Flask Documentation](https://flask.palletsprojects.com)
- [AWS Documentation](https://docs.aws.amazon.com)

---

## 🙏 Acknowledgments

- Course instructors for project requirements
- DevOps community for best practices
- Open source tools and their maintainers

---

**📧 Questions?** Open an issue on GitHub!