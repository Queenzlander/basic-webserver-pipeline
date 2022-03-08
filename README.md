# deploy a basic webserver pipeline using:
IDE - VSCode  
Source Control - Github  
CI - Jenkins  
Format - Docker  
Repo - AWS ECR (private repos)

# Other steps
ECR:
Ensure repo exists before completing the below (else the deploy stage will fail...)  
I also had to set a policy on the repo before I could download image from ECR (not sure if user error or if required with private repos)  

Jenkins:  
Create a new Item, call it something descriptive  
Select Multibranch Item  
Under 'Source Code Management' select 'Git'  
Enter Repository URL (and credentials if not public)  
Save (this will cause Jenkins to reachout and download files and complete creation of the pipeline based on content in the Jenkinsfile file)

