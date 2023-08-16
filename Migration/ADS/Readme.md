#Using ADS to pull data from instances

1. Get Admin IAM users and access keys <br>
2. create 2 EC2 Instances in any region except oregon using Amazon AMI , need port 22 open <br><
3. Open both EC2 instances
4. Use the command to Pull ADS Agent into both servers 
   ```
   curl -o ./aws-discovery-agent.tar.gz https://s3-us-west-2.amazonaws.com/aws-discovery-agent.us-west-2/linux/latest/aws-discovery-agent.tar.gz
   ```
   <br>
5. unzip the file
   ```
   tar -xzf aws-discovery-agent.tar.gz
   ```
   <br>
6. Install the file
   ```
   sudo bash install -r "us-west-2" -k "XXaccess_keyXX" -s "XXsecret_access_key_XX"
   ```
   a. These 3 commands can be put in a script, once the command is run you can begin data colelction from the AWS side
   <br><br>
8. Go to ADS - select target site as Home Region (This will open Migration Hub in Oregon) <br>
9. Click on Data Collectors and Discovery Agents
   >It should look like this
   >![image](https://github.com/victorwokili/AWSProjects/assets/18079443/44e3b454-7e2f-4c75-a639-e35e59c348f4)
   >
<br>
9. Check the server Information 
   >![image](https://github.com/victorwokili/AWSProjects/assets/18079443/101e180b-ebf2-4864-8a73-d83ab6f02324)

   <br>




6:48

