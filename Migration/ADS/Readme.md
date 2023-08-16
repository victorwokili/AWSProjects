Test

1. Get Admin IAM users and access keys (
2. create 2 EC2 Instances in any region except oregon using Amazon AMI , need port 22 open
3. Open both EC2 instances
4. Use the command to Pull ADS Agent into both servers 
   ```
   curl -o ./aws-discovery-agent.tar.gz https://s3-us-west-2.amazonaws.com/aws-discovery-agent.us-west-2/linux/latest/aws-discovery-agent.tar.gz
   ```
5. unzip the file
   ```
   tar -xzf aws-discovery-agent.tar.gz
   ```
6. Install the file
   ```
   sudo bash install -r "us-west-2" -k "XXaccess_keyXX" -s "XXsecret_access_key_XX"
   ```
   a. These 3 commands can be put in a script, once the command is run you can begin data colelction from the AWS side
8. 



6:48

