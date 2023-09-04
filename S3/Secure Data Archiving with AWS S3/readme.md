# Secure Data Archiving with AWS S3

At IBM, I was tasked with securely archiving critical business data for long-term retention for one of my clients. I implemented an AWS S3 storage solution to store this data cost-effectively and securely. To enhance data security, I configured versioning and cross-region replication, ensuring data durability and disaster recovery capabilities. Additionally, I utilized S3 lifecycle policies to automate the transition of older data to lower-cost storage classes like S3 Glacier and S3 Glacier Deep Archive. This not only saved costs but also ensured compliance with data retention policies.

My end goal was to transition older data to lower-cost storage classes for long-term retention and compliance with data retention policies. Create a secure, cost-effective, and compliant data archiving solution using AWS S3 that ensures long-term data retention and disaster recovery capabilities.
<br><br>
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/8585150f-50e3-4ffe-80e1-a754e7c01be4)

<br><br>

# STEPS

## Map out buckets
1) Get list of buckets and map out the target and destination buckets
  - In this refresher, i will be using already existing buckets named:
    - bucket 1  : `thisvaluehastobegloballyuniquedev`
    - bucket 2  : `thisvaluehastobegloballyuniqueprod`
<br><br><br>
## Block Public Access (BPA) for the account or specific buckets.
This is to ensure  least priviledged access. The granularity level all depends on the scope of work. <br><br>
2. Go to Amazon S3 and enable block public access
<br>

![image](https://github.com/victorwokili/AWSProjects/assets/18079443/89e30960-4e53-4ae7-b18e-5e2d5cd69c06)

<br>

3. Enable versioning to all buckets in scope
4. Enable MFA delete to all buckets in scope
  - Ensure the root user account has an MFA device to ensure correct configuration via CLI
  - MFA Delete can be only done via CLI

5. 


2) 
