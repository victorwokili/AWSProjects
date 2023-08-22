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
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/c43d586e-7e7c-473b-8618-bfc0171e957d)

<br><br><br>
**STAGING AREA SHOULD BE COMPLETED AFTER THIS STEP**
<br><br>

### TESTING STAGE


7. Edit the Launch Template and reset it as the Default Version
   ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/4b8917ed-35b8-4406-99d1-32e3d0826110)

   - Go to Launch Setting
   - Modify Launch Template
   - Ensure SG,instance Type etc are specified properly
   - Enable Auto-Assign Public IP
   - Create Template Version (Take note of version Number and Template ID)
   - Under the launch Template Window, click on the CREATE NEW TEMPLATE
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/3fa54bb1-e803-4616-9f79-b514179021d5)
   - Set the new template as the default Template
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/c85db75b-9585-4874-ac1b-2f74f683c70d)

8. Launch Test Instance
   - Go back to MGN
   - Click on Test and Cutover
   - Click on Launch Test Instances
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/f3f38104-ee05-459e-8bc2-2be4d9691f9e)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/2130bb98-bb06-466a-bd71-1219a5102162)
   -    - The conversion server is meant to take all of the images that was synced with the replciation server and then converts it which is delivered to the target server. It deletes itself after conversion
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/68ee3c76-6fb3-4e78-965a-74a7f3252df3)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/36ca5104-e7a9-4a53-a947-925157b24ec3)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/012f57a2-85d5-45d1-b262-fa4b8b5c596d)
   - Go to EC2 and Launch the Test Instance
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/64f8773d-597a-49a6-a265-7e2856b6d3d2)
   - Ensure all the files are properly migrated


9. CUTOVER
<br>a. **Mark as ready for Cutover**
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/c53f5123-33df-47b2-99c3-e9a9a086d4ab)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/6eaa7c39-8c36-4afb-a818-f224d4f9e5fa)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/e9188114-b5dd-47a9-a182-46a447467ea0)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/064a054a-f5f5-4236-b5cc-a45bb0bd8f0c)
   - 


<br>b. **Launch Cutover Instances**
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/e4abc4eb-152a-4400-93aa-d9779bc461a6)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/4140b97d-dfe1-4540-af61-b04cf8c73fe0)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/77d26997-2d46-4899-844c-560a0f18cdf4)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/a1c82250-196e-45ca-867f-ca16ef437121)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/bb57bb8e-5f67-40b7-959c-756a67b236c8)
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/cf03430b-c69f-4bf0-a39e-07887fdcbf09)



<br>c. **Finalize Cutover**
   - ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/8bb11c0d-2520-4c6b-aa4f-15e282c66249)




 ## 🎉🎉🎉 CUTOVER COMPLETE 🎉🎉🎉
 ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/bc91a646-331d-4392-8d02-7f20aa2bb941)
 ![image](https://github.com/victorwokili/AWSProjects/assets/18079443/23c0f29e-9ff0-4e13-af56-a43f87b93e95)









