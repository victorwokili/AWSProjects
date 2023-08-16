Test

1. Get Admin IAM users and access keys
2. create 2 EC2 Instances in any region except oregon using Amazon AMI , need port 22 open
3. Open both EC2 instances
4. Use the command to Pull ADS Agent into the server 
   ```
   curl -o ./aws-discovery-agent.tar.gz https://s3-us-west-2.amazonaws.com/aws-discovery-agent.us-west-2/linux/latest/aws-discovery-agent.tar.gz
   ```
6. f



6:46
tar -xzf aws-discovery-agent.tar.gz
6:48
sudo bash install -r "us-west-2" -k "XXX" -s "XXX"
