# Temporary Access Management with IAM Roles

During a project at my previous role, I was responsible for managing IAM users and roles to ensure proper access control across the organization's AWS accounts. One specific scenario involved granting temporary access to contractors who needed limited permissions. I created IAM roles with the necessary policies and configured AssumeRole permissions for the contractors. By implementing this, we ensured that contractors had access only to the resources required for their tasks and that their access was automatically revoked once their tasks were completed. This approach enhanced security by minimizing the exposure of sensitive resources.


In this project, I granted temporary access to contractors using IAM roles. This will allow them to access specific resources for a limited time, enhancing security and minimizing resource exposure.


<br><br>

## Create an IAM role with the necessary permissions for EC2 instances and S3 buckets.
1. Go to IAM and create a role (`Name : ContractorRole`)
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/068baf69-f1ba-4cd0-899c-4397815142b0)

2. Considering there are 2 aws services needed create a custom trust policy 
<img width="1261" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/504edd57-71bb-4de1-8a43-2cb3e2139298">
<br><br>
3. Paste the code below that allows S3 and EC2 access **(will need user ARN from step 9)** <br><br>
This JSON policy allows both the "s3.amazonaws.com" and "ec2.amazonaws.com" services to assume the "ContractorRole" by users matching the specified AWS IAM user ARN.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "INSERT CONTRACTOR USER ARN",
                "Service": [
                    "s3.amazonaws.com",
                    "ec2.amazonaws.com"
                            ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}

```
<br>

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/5f8189ac-8451-4b0d-84a9-832d5972adb8)
<br><br>
<br>
## Create a read-only access for S3 and EC2 to grant access to the role with a time-limited condition. <br>
4. Under permission policies select ReadOnlyAccess for S3 and EC2
<img width="1265" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/cac94397-3e23-4045-8893-ea1bd81966e6">
<img width="1243" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/87cd21b2-bac2-4918-934e-b95a0b88dbc6">
<img width="1307" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/eb8c70a9-b4fc-4983-a7a1-d06b5411ce41">

<br>

<br><br>

5. Save role name as `ContractorRole` <br>
<img width="177" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/f6d4b5b1-1515-4940-8501-49ed651207d7">
<br><br>

## Create a policy for Temporary Access
 Create a policy called `TemporaryAccessPolicy`


6. Create a `TemporaryAccessPolicy` Policy under contractor role
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/04ca6bf8-b463-46af-839a-62f1c69442ca)

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ec2:*",
            "Resource": "*",
            "Condition": {
                "DateLessThan": {
                    "aws:CurrentTime": "2023-07-31T23:30:00Z"
                }
            }
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*",
            "Condition": {
                "DateLessThan": {
                    "aws:CurrentTime": "2023-07-31T23:30:00Z"
                }
            }
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Deny",
            "Action": "ec2:*",
            "Resource": "*",
            "Condition": {
                "DateGreaterThan": {
                    "aws:CurrentTime": "2023-09-09T23:30:00Z"
                }
            }
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Deny",
            "Action": "s3:*",
            "Resource": "*",
            "Condition": {
                "DateGreaterThan": {
                    "aws:CurrentTime": "2023-09-09T23:30:00Z"
                }
            }
        }
    ]
}

```

<br><br>
OR
<br><br>

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "ec2:*"
            ],
            "Resource": "*",
            "Condition": {
                "DateLessThan": {
                    "aws:CurrentTime": "2023-08-31T23:30:00Z"
                }
            }
        },
        {
            "Effect": "Deny",
            "Action": [
                "s3:*",
                "ec2:*"
            ],
            "Resource": "*",
            "Condition": {
                "DateGreaterThan": {
                    "aws:CurrentTime": "2023-09-09T23:30:00Z"
                }
            }
        }
    ]
}
```
<br><br><br>

 




## Create a Custom User

7. Create a custom user named `ContractorUser'
<img width="1278" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/2b6816c8-9800-41c6-bdb3-a9ffb882641f">
<br>
8. Add permissions

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/769ae7ec-e00e-4d6a-85d3-a7512145eb20)

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/e748b2d1-c0c6-4a25-9151-6e7253737a42)

<br>
9. Grab user ARN

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/3d1d072d-1e70-44a9-91a1-8df0b4833a1b)
<br><br>
10. For programatic access, collect access and secret access key
<br>

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/ccbd26c1-a557-4bfd-a48e-8c1ac76482b8)

<br>

## Test ContractorUser with EC2 and S3
This is to simulate an environment <br><br>
11. Launch EC2 instance in main account

12. Create S3 buckets in main account
13. login to AWS programatically with access keys
    
- configure AWS in terminal `aws configure`

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/ac043125-83e5-4214-8150-4397b0470adb)

<br>

- Copy Role ARN and replace in code below **This will attach the role to the user named ContractorUser**
```
aws configure set role_arn arn:aws:iam::687746774026:role/ContractorRole
aws configure set source_profile default
aws configure set role_session_name ContractorROle
aws configure set region us-east-1
aws configure set output json
```

## CONSOLE ACCESS
14. Give console access to user
15. login to console with the user
16. Assume Role
    - Click on switch role
    - Collect the Accout ID of the primary Account
    - Put the name of the role `ContractorRole` <br>
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/b0e1e12c-89e8-445a-b2c3-fb843fbab8b8)

<br>


![image](https://github.com/victorwokili/AWSProjects/assets/18079443/2caf9b9d-4a39-4846-a064-458ae5d92145)

<br>

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/9128714d-24b3-486b-8a26-1cca8bdd2a45)

<br>

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/9478793b-bed0-4a3b-9958-6ac099edc56f)

<br>

17. You should have access to the AWS Services <br>

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/c1686a2d-d76a-4a92-8cea-26c075113f95)

<br>

### Test services
18. Check to see if you can find the EC2 instances : <br>
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/c3027506-95de-4078-a88d-5892eaf8d190) <br>
Success: <br>
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/b28f5486-7595-4009-b70b-51ab19916321) <br>

19. Check S3 `aws s3 ls` <br>
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/e9b4f1af-8b7d-4487-808e-aa77e32d54da)
<br>
20. Try using a different service from S3 and EC2

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/356e0a43-9325-44ba-83f1-22cc2918b7b4)











## Things to remember:
1. Role:
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/e10da5af-8f41-47d9-a8bc-fa677e39ca33)

2.[AWS Policy Generator](https://policysim.aws.amazon.com](https://awspolicygen.s3.amazonaws.com/policygen.html)https://awspolicygen.s3.amazonaws.com/policygen.html) can be used to create policy


## reference:
1. https://www.youtube.com/watch?v=tg7Ahng08h8

