We want to create a DynaboDB table and put sample data into the table. We want to do this from the CLI.

1. Create a VPC with 2 public and 2 private subnets
2. Create a AWS Cloud9 Environment deployed in the Public Subnet. Use an t3.meduim Linux instance
3. Log into cloud9 and verify that your AWS credentials have been properly configured.
aws sts get-caller-identity


4. Create 4 the DynamoDB tables
aws dynamodb batch-write-item --request-items file://ProductCatalog.json 

aws dynamodb batch-write-item --request-items file://Forum.json

aws dynamodb batch-write-item --request-items file://Thread.json

aws dynamodb batch-write-item --request-items file://Reply.json


5. List to confirm tables have been created $ aws dynamodb list-tables
6. Download sample data
7. Load sample data
8. Explore tables in the console and query
9. PITR backups
Manual Backups
