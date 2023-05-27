Steps:
1) Create Resource Groups
2)Create Basline
3) Create Maintenance window
4) For the SSM Role, give SNS and S3 full access
5) Download the insanity files and open in a text editor
6) Upload the s3_insanity check.sh file into the bucket
7) Copy your bucket name and update the json script with your bucket name. line 33 and 36. the object uri should work
8) Copy the file name and update the json script with the file name
9) Create aa folder in that bucket and give it a name log.
10) Create an SNS topic
11) Copy the topic arn and update the json script. Update the region id on that same line of the file. Line 37
12) Subscribe to that topic using email
13) Set up infrastructure
14) Create an IAM role for EC2 with the policies ( SSM full access, S3 full access, and SNS full access) We already have this IAM role from our last class. We just need to add permissions to it. \n
15) Launch 2 amazon linux2 AMI. Attach the role. No user data
16) Tag Name Webservers
17) Create a run command document in SSM using ssm-runcommand-doc.json
18) Go to documents and select create a document
19) Provide a document name and specify EC2 instance for resource type
20) Copy and paste the content of the ssm-runcommand-doc.json to it.
21) Once the command runs, you will see the output in CW logs or in an email since this is intergrated with SNS
