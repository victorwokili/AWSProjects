  # Custom IAM Policies for Developer Access
<br>
<br>

### Scenario:
My organization needed to grant different levels of access to a group of developers working on a critical application.
However, standard AWS managed policies don't exactly fit your requirements. I crafted custom IAM policies tailored to the developers' specific tasks
and resource requirements. This project will involve specifying fine-grained permissions, using conditions to control access based on IP ranges 
and resource tags, and testing the policies extensively to ensure they grant the right level of access while maintaining security.

## Define Requirements
Before crafting custom IAM policies, you need to clearly define the requirements of the developers' access. What AWS services 
and resources do they need access to, and what actions should they be able to perform? Are there any specific IP ranges they should access
from? Document these requirements.

1. **Access:** The group of developers should have access to the following:
    - AWS Services: For the sake of simplicty we would only allow EC2

3. 
