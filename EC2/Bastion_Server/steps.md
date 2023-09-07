# Lab Steps:

1.Create the networking stack: VPC, 1 public subnet and 1 private subnet.

2.Create a Security group and give it a name Bastion-SG. Open port 22 to the internet. Copy the ID of the Bastion SG

3.Create another Security group with name Appserver-SG. Open port 22 to Bastion-SG. Ensure there is no outbound rule for the SG 
<img width="1116" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/ed2748e6-c7f7-4eb1-89f5-274c03a61855">


4.Create 1 instance in a public subnet using Amazon linux 2 AMI and give it a name Test-Bastion. Use the Bastion security group

5.Create another instance in a private subnet Amazon linux 2 AMI and give it a name Test-App Server. Use the Appserver-SG

6.SSH into Test-Bastion.

7.SSH into Test-App Server from the Bastion

8.Configure your CLI

9.Try to access S3 and it will fail

10.Create Gateway endpoint

11.Try to access S3 and you will succeed

![image](https://user-images.githubusercontent.com/18079443/233160350-8c4afe1c-8205-44ee-ad22-2193233482b4.png)


