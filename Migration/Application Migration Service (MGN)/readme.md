# USING THE APPLICATION MIGRATION SERVICE (MGN)

### STEPS:
1. Spin up an Amazon EC2 Instance in the source region
2. SSH Into the instance <br>
   - [ ]  Install Apache
   - [ ]  Create an HTML file so we could have a web application
   - [ ]  Create dummy files and directories on the source server
3. Go to MGN in the destination region and set it up
4. Create an IAM user in the source region
   - [ ] AWS APPLICATION MIGRATION POLICY
   - [ ] DOWNLOAD THE CREDENTIALS
6. Use the IAM crentials run it into the command, then use the command from MGN to install the agent on the source server
   - Wait for agent to start creeating the staging area, setup replication server and sync process
7. Modify the Launch Template
8. Launch our test instances
   - If everything looks good, go to step 10
10. Launch Cutover Instances
