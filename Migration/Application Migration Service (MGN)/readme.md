# USING THE APPLICATION MIGRATION SERVICE (MGN) FOR LIFT AND SHIFT

References:
[Amazon Video](https://www.youtube.com/watch?v=ao8geVzmmRo)


![image](https://github.com/victorwokili/AWSProjects/assets/18079443/4e869b11-5a71-4f08-aba5-54c0c60c435c)


## STEPS:
1. Create an IAM user 
   - [ ] User name : MGN-USER
   - [ ] Attach Policy: Administrator Access
   - [ ] Attach Policy : AWSApplicationMigrationAgentPolicy
   - [ ] Attach Policy : AWSApplicationMigrationAgentPolicy_V2
   - [ ] Create User
   - [ ] Grant Access Keys and Download Credentials
     <br><br><br>

### INSTALL MGN AGENT IN SOURCE SERVER 
2. Spin up an Amazon EC2 Instance in the source region (us-west-1)
   - For the SG open Port 22 (SSH) and 80 (HTTP)
   - Ensure there is a key pair to enable SDSh
     
4. SSH Into the instance <br>
   - [ ]   Update instance <br>
            ` sudo yum update -y`
   - [ ]   Install Apache <br>
            `sudo yum install httpd -y`
   - [ ]   Enable persistent service upon system reboot <br>
            `sudo systemctl enable httpd`
   - [ ]   Start the Apache Service <br>
            `sudo systemctl start httpd`
   - [ ]  Create an HTML file so we could have a web application <br>
         - cd to the HTMl directory <br>
          - `cd /var/www/html/`<br>
         - create an html file <br>
          -  `sudo vim index.html` or  -  `sudo nano index.html`<br> 
   - [ ]  Create dummy files and directories on the source server (EC2 instance) <br><br>

   
5. Go to MGN in the destination region (us-west-2) and set it up
    ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/3753005e-19ac-4614-9e23-490a2a9b1d6c)
   - MGN initializes and creates everything that is needed
   - [ ] Add the source server
   - [ ] Input IAM accesskey and IAMsecretaccesskey
   - [ ] run the first installer command in the source server instance
  ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/19e0a114-70a8-4c22-96ab-df83774147d7) <br>
 command 1:  `sudo wget -O ./aws-replication-installer-init https://aws-application-migration-service-us-west-2.s3.us-west-2.amazonaws.com/latest/linux/aws-replication-installer-init`

   - [ ] Run the second command to dpwm;pad and install the AWS Replication Agent
         command 2: ` sudo chmod +x aws-replication-installer-init; sudo ./aws-replication-installer-init --region us-west-2 --aws-access-key-id INSERT-ACCESS-KEYIF --aws-secret-access-key INSERTSECRETACCCESSKEY --no-prompt `

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/28b88fae-79d4-4f3b-80c2-a11fd01687df)
<br>before

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/15a036af-0d34-4bb4-bfd7-3f62aa53f8a5)
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/bb6f080a-7d42-45b2-9730-cc175c37b892)
after 



   6. Wait for the server to show **Ready for Testing**
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/0acd52cd-06fc-4fa9-aabb-cab48bec814c)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/b72d361a-7af8-4187-b0e1-373e2bf2e42c)




<br><br><br>
**STAGING AREA SHOULD BE COMPLETED AFTER THIS STEP**
<br><br>

### TESTING STAGE

7. Use the IAM crentials run it into the command, then use the command from MGN to install the agent on the source server
   - Wait for agent to start creeating the staging area, setup replication server and sync process
8. Modify the Launch Template
9. Launch our test instances
   - If everything looks good, go to step 10
10. Launch Cutover Instances
