# Temporary Access Management with IAM Roles

In this project, I granted temporary access to contractors using IAM roles. This will allow them to access specific resources for a limited time, enhancing security and minimizing resource exposure.


<br><br>

## Create an IAM role with the necessary permissions for EC2 instances and S3 buckets.
1. Go to IAM and create a role (`Name : ContractorRole`)
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/068baf69-f1ba-4cd0-899c-4397815142b0)

2. Considering there are 2 aws services needed create a custom trust policy 
<img width="1261" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/504edd57-71bb-4de1-8a43-2cb3e2139298">

3. Paste the code below that allows S3 and EC2 access
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
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

## Create a read-only access for S3 and EC2 to grant access to the role with a time-limited condition.
4a. Under permission policies select ReadOnlyAccess for S3 and EC2
<img width="1265" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/cac94397-3e23-4045-8893-ea1bd81966e6">
<img width="1243" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/87cd21b2-bac2-4918-934e-b95a0b88dbc6">
<img width="1307" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/eb8c70a9-b4fc-4983-a7a1-d06b5411ce41">

<br>


5. Select the TemporaryReadAcessPolicy and attach it to the role
<img width="1254" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/39bd469c-7ba5-43cb-85a1-0dd635768cfb">

7. Save role name as `ContractorRole`
<img width="177" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/f6d4b5b1-1515-4940-8501-49ed651207d7">


## Create a policy for Temporary Access
9. Create a policy called `TemporaryAccessPolicy`
10. Copy the code below
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:*","ec2:*"],
      "Resource": "*",
      "Condition": {
        "DateLessThan": {
          "aws:CurrentTime": "2023-08-31T23:30:00Z"
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
```

## Create a Custom User

8. Create a custom user named `ContractorUser'
<img width="1278" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/2b6816c8-9800-41c6-bdb3-a9ffb882641f">

9. Add permissions
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/769ae7ec-e00e-4d6a-85d3-a7512145eb20)
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/e748b2d1-c0c6-4a25-9151-6e7253737a42)

10. 


## Things to remember:
1. Role:
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/e10da5af-8f41-47d9-a8bc-fa677e39ca33)

2.[AWS Policy Generator](https://policysim.aws.amazon.com](https://awspolicygen.s3.amazonaws.com/policygen.html)https://awspolicygen.s3.amazonaws.com/policygen.html) can be used to create policy


## reference:
1. https://www.youtube.com/watch?v=tg7Ahng08h8

