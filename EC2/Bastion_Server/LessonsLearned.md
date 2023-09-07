# Lessons Learned

## Subnet creation
1. For Public subnets, ensure to enable auto-assign public IPv4 address
<img width="805" alt="image" src="https://user-images.githubusercontent.com/18079443/233165840-613babb7-c2cc-4032-bd2d-e18420161465.png">

2.This is probably a good naming convention for subnets
<img width="1073" alt="image" src="https://user-images.githubusercontent.com/18079443/233166045-0e87b87a-6bf9-449a-afb3-87e14d8e9d4c.png">

3. The Main Route Table should be associated with the Private Subnet for security reasons.
<img width="1075" alt="image" src="https://user-images.githubusercontent.com/18079443/233166987-21e9e9be-cb9f-49c0-aa3d-7799b5105e13.png">

    as you can see, this the Route Table containing the IGW is not a main route table
   <img width="1030" alt="image" src="https://user-images.githubusercontent.com/18079443/233167718-a3f8e9ec-6f27-417b-932a-0a8ec747c4f7.png">



4. Remember the concept of statefulness in security group for outbound rules.
   


