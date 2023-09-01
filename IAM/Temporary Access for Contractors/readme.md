# Temporary Access Management with IAM Roles

In this project, I granted temporary access to contractors using IAM roles. This will allow them to access specific resources for a limited time, enhancing security and minimizing resource exposure.


<br><br>

## Create an IAM role  with the necessary permissions for EC2 instances and S3 buckets.
1. Go to IAM and create a role
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

## Create a select read-only access for S3 and EC2 or create a custom IAM permission policy (for granular control) to grant access to the role with a time-limited condition.
4a. Under permission policies select ReadOnlyAccess for S3 and EC2
<img width="1265" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/cac94397-3e23-4045-8893-ea1bd81966e6">
<img width="1243" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/87cd21b2-bac2-4918-934e-b95a0b88dbc6">
<img width="1307" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/eb8c70a9-b4fc-4983-a7a1-d06b5411ce41">

<br>
### OR
<br>
4b. Create a custom permission policy named TemporaryReadAccessPolicy

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:GetIpamResourceCidrs",
				"ec2:GetIpamPoolCidrs",
				"ec2:GetInstanceUefiData",
				"s3:GetObjectVersionTagging",
				"ec2:GetEbsEncryptionByDefault",
				"ec2:ExportClientVpnClientConfiguration",
				"ec2:GetHostReservationPurchasePreview",
				"s3:GetStorageLensConfigurationTagging",
				"ec2:GetConsoleScreenshot",
				"s3:GetObjectAcl",
				"s3:GetBucketObjectLockConfiguration",
				"s3:GetIntelligentTieringConfiguration",
				"ec2:GetLaunchTemplateData",
				"ec2:GetSerialConsoleAccessStatus",
				"s3:GetObjectVersionAcl",
				"ec2:GetEbsDefaultKmsKeyId",
				"ec2:GetIpamDiscoveredResourceCidrs",
				"s3:GetBucketPolicyStatus",
				"s3:GetObjectRetention",
				"ec2:GetManagedPrefixListEntries",
				"s3:GetBucketWebsite",
				"s3:GetJobTagging",
				"ec2:CreateTags",
				"s3:GetMultiRegionAccessPoint",
				"s3:GetObjectAttributes",
				"ec2:GetNetworkInsightsAccessScopeContent",
				"s3:GetObjectLegalHold",
				"s3:GetBucketNotification",
				"ec2:GetReservedInstancesExchangeQuote",
				"s3:DescribeMultiRegionAccessPointOperation",
				"s3:GetReplicationConfiguration",
				"s3:GetObject",
				"ec2:GetPasswordData",
				"ec2:GetAssociatedIpv6PoolCidrs",
				"s3:DescribeJob",
				"ec2:GetSpotPlacementScores",
				"s3:GetAnalyticsConfiguration",
				"s3:GetObjectVersionForReplication",
				"ec2:GetAwsNetworkPerformanceData",
				"s3:GetAccessPointForObjectLambda",
				"ec2:GetIpamDiscoveredAccounts",
				"s3:GetStorageLensDashboard",
				"ec2:GetResourcePolicy",
				"s3:GetLifecycleConfiguration",
				"s3:GetAccessPoint",
				"s3:GetInventoryConfiguration",
				"s3:GetBucketTagging",
				"ec2:GetDefaultCreditSpecification",
				"ec2:DeleteTags",
				"s3:GetAccessPointPolicyForObjectLambda",
				"s3:GetBucketLogging",
				"ec2:GetCapacityReservationUsage",
				"ec2:GetNetworkInsightsAccessScopeAnalysisFindings",
				"s3:GetAccelerateConfiguration",
				"ec2:GetSubnetCidrReservations",
				"s3:GetObjectVersionAttributes",
				"s3:GetBucketPolicy",
				"ec2:GetConsoleOutput",
				"ec2:ExportClientVpnClientCertificateRevocationList",
				"s3:GetEncryptionConfiguration",
				"s3:GetObjectVersionTorrent",
				"s3:GetBucketRequestPayment",
				"ec2:GetFlowLogsIntegrationTemplate",
				"s3:GetAccessPointPolicyStatus",
				"s3:GetObjectTagging",
				"s3:GetMetricsConfiguration",
				"s3:GetBucketOwnershipControls",
				"s3:GetBucketPublicAccessBlock",
				"s3:GetMultiRegionAccessPointPolicyStatus",
				"s3:GetMultiRegionAccessPointPolicy",
				"s3:GetAccessPointPolicyStatusForObjectLambda",
				"ec2:GetCoipPoolUsage",
				"s3:GetBucketVersioning",
				"s3:GetBucketAcl",
				"s3:GetAccessPointConfigurationForObjectLambda",
				"ec2:GetAssociatedEnclaveCertificateIamRoles",
				"ec2:GetIpamAddressHistory",
				"s3:GetObjectTorrent",
				"s3:GetMultiRegionAccessPointRoutes",
				"s3:GetStorageLensConfiguration",
				"s3:GetAccountPublicAccessBlock",
				"s3:GetBucketCORS",
				"ec2:GetManagedPrefixListAssociations",
				"s3:GetBucketLocation",
				"s3:GetAccessPointPolicy",
				"s3:GetObjectVersion"
			],
			"Resource": "*",

		}
	]
}
```


or

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": "ec2:*",
			"Resource": "*"
		}
	]
}
```
5. Select the TemporaryReadAcessPolicy and attach it to the role
<img width="1254" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/39bd469c-7ba5-43cb-85a1-0dd635768cfb">

7. Save role name as `ContractorRole`
<img width="177" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/f6d4b5b1-1515-4940-8501-49ed651207d7">



## Create a Custom User

8. Create a custom user named `ContractorUser'
<img width="1278" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/2b6816c8-9800-41c6-bdb3-a9ffb882641f">

9. Create a policy called `TemporaryAccessPolicy`
```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:GetIpamResourceCidrs",
				"ec2:DescribeInstances",
				"ec2:GetIpamPoolCidrs",
				"ec2:GetInstanceUefiData",
				"ec2:GetEbsEncryptionByDefault",
				"s3:GetObjectVersionTagging",
				"ec2:ExportClientVpnClientConfiguration",
				"ec2:GetHostReservationPurchasePreview",
				"ec2:GetConsoleScreenshot",
				"s3:GetStorageLensConfigurationTagging",
				"s3:GetObjectAcl",
				"s3:GetBucketObjectLockConfiguration",
				"ec2:GetLaunchTemplateData",
				"s3:GetIntelligentTieringConfiguration",
				"ec2:GetSerialConsoleAccessStatus",
				"ec2:GetEbsDefaultKmsKeyId",
				"s3:GetObjectVersionAcl",
				"ec2:GetIpamDiscoveredResourceCidrs",
				"s3:GetBucketPolicyStatus",
				"ec2:GetManagedPrefixListEntries",
				"s3:GetObjectRetention",
				"s3:GetBucketWebsite",
				"s3:GetJobTagging",
				"s3:GetMultiRegionAccessPoint",
				"s3:GetObjectAttributes",
				"ec2:GetNetworkInsightsAccessScopeContent",
				"s3:GetObjectLegalHold",
				"s3:GetBucketNotification",
				"ec2:GetReservedInstancesExchangeQuote",
				"s3:DescribeMultiRegionAccessPointOperation",
				"s3:GetReplicationConfiguration",
				"s3:GetObject",
				"ec2:GetPasswordData",
				"ec2:GetAssociatedIpv6PoolCidrs",
				"s3:DescribeJob",
				"ec2:GetSpotPlacementScores",
				"s3:GetAnalyticsConfiguration",
				"s3:GetObjectVersionForReplication",
				"ec2:GetAwsNetworkPerformanceData",
				"ec2:GetIpamDiscoveredAccounts",
				"s3:GetAccessPointForObjectLambda",
				"s3:GetStorageLensDashboard",
				"ec2:GetResourcePolicy",
				"s3:GetLifecycleConfiguration",
				"s3:GetAccessPoint",
				"ec2:GetDefaultCreditSpecification",
				"s3:GetInventoryConfiguration",
				"s3:GetBucketTagging",
				"s3:GetAccessPointPolicyForObjectLambda",
				"s3:GetBucketLogging",
				"ec2:GetCapacityReservationUsage",
				"ec2:GetNetworkInsightsAccessScopeAnalysisFindings",
				"s3:GetAccelerateConfiguration",
				"ec2:GetSubnetCidrReservations",
				"s3:GetObjectVersionAttributes",
				"s3:GetBucketPolicy",
				"ec2:GetConsoleOutput",
				"ec2:ExportClientVpnClientCertificateRevocationList",
				"s3:GetEncryptionConfiguration",
				"s3:GetObjectVersionTorrent",
				"ec2:GetFlowLogsIntegrationTemplate",
				"s3:GetBucketRequestPayment",
				"s3:GetAccessPointPolicyStatus",
				"s3:GetObjectTagging",
				"s3:GetMetricsConfiguration",
				"s3:GetBucketOwnershipControls",
				"s3:GetBucketPublicAccessBlock",
				"s3:GetMultiRegionAccessPointPolicyStatus",
				"s3:GetMultiRegionAccessPointPolicy",
				"s3:GetAccessPointPolicyStatusForObjectLambda",
				"ec2:GetCoipPoolUsage",
				"s3:GetBucketVersioning",
				"s3:GetBucketAcl",
				"s3:GetAccessPointConfigurationForObjectLambda",
				"ec2:GetAssociatedEnclaveCertificateIamRoles",
				"ec2:GetIpamAddressHistory",
				"s3:GetObjectTorrent",
				"s3:GetMultiRegionAccessPointRoutes",
				"s3:GetStorageLensConfiguration",
				"s3:GetAccountPublicAccessBlock",
				"ec2:GetManagedPrefixListAssociations",
				"s3:GetBucketCORS",
				"s3:GetBucketLocation",
				"s3:GetAccessPointPolicy",
				"s3:GetObjectVersion"
			],
			"Resource": "*"
		},
		{
			"Sid": "VisualEditor1",
			"Effect": "Allow",
			"Action": "sts:AssumeRole",
			"Resource": "*",
			"Condition": {
				"DateGreaterThan": {
					"aws:CurrentTime": "2023-08-31T00:00:00Z"
				},
				"DateLessThan": {
					"aws:CurrentTime": "2023-09-01T23:59:59Z"
				}
			}
		}
	]
}
```


Things to remember:
1. Role:
![image](https://github.com/victorwokili/AWSProjects/assets/18079443/e10da5af-8f41-47d9-a8bc-fa677e39ca33)

2.[AWS Policy Generator](https://policysim.aws.amazon.com](https://awspolicygen.s3.amazonaws.com/policygen.html)https://awspolicygen.s3.amazonaws.com/policygen.html) can be used to create policy
