Instance 1 - Create amaxon 2 Linux 2 AMI - comes with Agent ,  should have public subnet and IAM role.

instance 2 - Create centOS 7 AMI - comes with no agent (need to install agent), use IAM role.

instance 3 - Create RHEL 8 AMI - comes with no agent (need to install agent), No IAM role, use hybrid activation to replace IAM role and install SSM agent.

Simulate patch manager.

1. Create an Instance Profile to allow SSM
 2. Launch a CentOs 7 instance with user data to install SSM. Use the instance profile created in step 1. No SG rules and no keys
 3. Create a Hybrid Activation for your instance.
 4. Launch a second instance using RHEL 8  With User Data for Hybrid activation. No IAM role No SG rules and no keys
 5. Launch a 3rd instance with Amazon Linux 2 AMI. User IAM role and No user data  No SG rules and no keys

Simulate system manager capabilities.
