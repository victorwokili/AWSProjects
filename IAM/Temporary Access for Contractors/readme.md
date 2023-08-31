# Temporary Access Management with IAM Roles

In this project, I granted temporary access to contractors using IAM roles. This will allow them to access specific resources for a limited time, enhancing security and minimizing resource exposure.



### Create an IAM role  with the necessary permissions for EC2 instances and S3 buckets.
1. Go to IAM and create a role
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/068baf69-f1ba-4cd0-899c-4397815142b0)

2. 
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

## Create a custom IAM policy to grant access to the role with a time-limited condition.

## Create a Custom User

