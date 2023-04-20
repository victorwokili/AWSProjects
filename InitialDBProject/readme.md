# DB Project

## Introduction

This project would be used to test VPC, EC2 and S3 skills

### User Story:

A web application will need to be created which contains a database. We have decided to use AWS PaaS in the creation of this web application. 
There will be 2 private database servers. 

  i. db_server : this private server will be connected to the internet in order to update the latest packages
  ii. db2_server : this private server will not be connected to the internet but will be connected to the S3 AWS service only


### **Naming Convention**

1) **VPC:**

 We need to create a VPC containing 2 private and 2 public subnet 

    a. Name of public subnet  : jjtech_public_subnet
    
      i.AZ: us-west-2a
      ii. CIDR : 10.0.1.0/24
      
    b. Name of private subnet  : jjtech_private_subnet
    
      i.AZ: us-west-2b
      ii. CIDR : 10.0.2.0/24
      
    c. Name of VPC : JJTechVPC 
      i. region: us-west-2
      ii. CIDR : 10.0.0.0/16

2) **Instances :**

 We need to create 4 instances containing 2 private and 2 public subnet 

    a. Name of public subnet 1 : bastion_server
    
      i.subnet: public
      
    b. Name of public subnet 2 : web_server
    
      i.subnet: public
      
    c. Name of private subnet 1 : db_server
    
      i.subnet: private
      
    d. Name of private subnet 2 : db2_server
    
      i.subnet: private
      
  







# ASSIGNMENT :
Create an architectural diagram highlighting the user-story and naming convention above.  

### TIPS: 
This incorporates concepts such as :
  1) Endpoints
  2) NAT Gateways
  3) Route Tables
  4) Internet Gateway 

Make sure to incoporate these into your architectural diagram. This diagram will be essential when setting things up in the AWS console
