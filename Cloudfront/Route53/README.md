1. Create 2 servers with different user data
 2. Create a target group
 3. Configure an application load balancer using the target groups
 4. Request a public certificate in ACM for the cloud front distribution. Use NOVA region only
 5. Create cloudfront distribution for your root domain
 6. Create a route 53 A record for cloud front distribution
 7. Test dns
Other routing policies.


Architecture:

<img width="1072" alt="image" src="https://github.com/victorwokili/AWSProjects/assets/18079443/1ce95c6d-164c-48ad-a2b6-bd4ada84bbe7">


AWS  Certificate Manager : 
