# USING THE APPLICATION MIGRATION SERVICE (MGN)

### STEPS:
1. Create an IAM user 
   - [ ] User name : MGN-USER
   - [ ] Attach Policy: Administrator Access
   - [ ] Attach Policy : AWSApplicationMigrationAgentPolicy
   - [ ] Attach Policy : AWSApplicationMigrationAgentPolicy_V2
   - [ ] Create User
   - [ ] Grant Access Keys and Download Credentials
     <br>
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
   - [ ]  Create dummy files and directories on the source server
5. Go to MGN in the destination region and set it up
6. Use the IAM crentials run it into the command, then use the command from MGN to install the agent on the source server
   - Wait for agent to start creeating the staging area, setup replication server and sync process
7. Modify the Launch Template
8. Launch our test instances
   - If everything looks good, go to step 10
9. Launch Cutover Instances
