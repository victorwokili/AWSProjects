# USING THE APPLICATION MIGRATION SERVICE (MGN)

### STEPS:
1. Create an IAM user in the source region
   - [ ] AWS APPLICATION MIGRATION POLICY
   - [ ] DOWNLOAD THE CREDENTIALS
2. Spin up an Amazon EC2 Instance in the source region
3. SSH Into the instance <br>
   - [ ]  Install Apache
   - [ ]  Create an HTML file so we could have a web application
   - [ ]  Create dummy files and directories on the source server
4. Go to MGN in the destination region and set it up
5. Use the IAM crentials run it into the command, then use the command from MGN to install the agent on the source server
   - Wait for agent to start creeating the staging area, setup replication server and sync process
6. Modify the Launch Template
7. Launch our test instances
   - If everything looks good, go to step 10
8. Launch Cutover Instances
