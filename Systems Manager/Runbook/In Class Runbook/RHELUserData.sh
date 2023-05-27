#!/bin/bash
mkdir /tmp/ssm
sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl stop amazon-ssm-agent
sudo amazon-ssm-agent -register -code "YOUR-CODE" -id "YOUR-ID" -region "YOUR-REGION"
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
