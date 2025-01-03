# ec2-instance

This is based off the DevOps Roadmap Project [EC2 Instance](https://roadmap.sh/projects/ec2-instance)

Create an EC2 instance on AWS and connect to it using SSH.

This is number 11 of [DevOps Projects](https://roadmap.sh/devops/projects) as per roadmap.sh


## Description From Site 

The goal of this project is to create an AWS account, set up a Linux server on AWS EC2, and deploy a simple static website. This project will help you gain hands-on experience with cloud computing, specifically with Amazon Web Services (AWS).

## Requirements

You are required to complete the following tasks:


- [X] Create an AWS account if you don’t have one already.
- [X] Familiarize yourself with the AWS Management Console.
- [X] Launch an EC2 instance with the following specifications:
    - [X] Use Ubuntu Server AMI.
    - [X] Choose a t2.micro instance type (eligible for AWS Free Tier).
    - [X] Use the default VPC and subnet for your region.
    - [X] Configure the security group to allow inbound traffic on ports 22 (SSH) and 80 (HTTP).
    - [X] Create a new key pair or use an existing one for SSH access.
    - [X] Assign a public IP address to your instance.
- [X] Connect to your EC2 instance using SSH and the private key.
- [X] Update the system packages and install a web server (e.g., Nginx).
- [X] Create a simple HTML file for your static website.
- [X] Deploy the static website to your EC2 instance.
- [X] Access your website using the public IP address of your EC2 instance.

## Stretch Goals

If you want to challenge yourself further, try these additional tasks:

- [X] Create a simple CI/CD pipeline using ~~AWS CodePipeline~~ Github Actions to automatically deploy changes to your website. 
- [ ] Implement HTTPS using a free SSL/TLS certificate from Let’s Encrypt.
- [ ] Set up a custom domain name for your website using Amazon Route 53.

## Learning Outcomes

After completing this project, you will have gained practical experience in:

- Creating basic AWS resources
- Learn about AWS instances, types and differences
- Launching and configuring EC2 instances
- Connecting to Linux servers using SSH
- Basic server administration and web server setup
- Deploying static websites to cloud infrastructure

After finishing this project you should have a good understanding of launching and connecting to EC2 instances, basic knowledge of security groups, and be able to deploy any of the projects from previous tasks using AWS EC2. Future project ideas will be based on these concepts.

## To Run: 

- Setup the following repository secrets:
    - DO_TOKEN : Digital Ocean access token
    - DO_SPACES_SECRET_KEY  : Digital Ocean spaces secret key (for Terraform state file)
    - DO_SPACES_ACCESS_KEY  : Digital Ocean spaces access key (for Terraform state file)
    - AWS_SSH_PUBLIC_KEY    : Keypair to be used for VM 
    - AWS_SSH_PRIVATE_KEY   : Keypair to be used for VM
    - AWS_ACCESS_KEY_ID     : See Note
    - AWS_SECRET_ACCESS_KEY : See Note

- Note: Setup an IAM User for Terraform to use,  following `least privilege policy`. Once created generate `Access Key ID` and `Secret Access Key`

# Notes 

- Still using the DigitalOcean bucket to hold state file. Simply due to ease and already setup. 
- Could have simplified the use of aws credentials (i.e. justset in pipeline, no need for explicit vars in TF), but stuck to more explicit due to use of two providers


## Lessons Learned: 

- TF Plan already factors in variables passed so no need to re-pass in apply. 