
## Version 1
- Begin by having Dockerhub account. Which you will use to create a public repository to host your image. 
    > Refer to the Docker Documentation on how to create a public repo [Here](https://docker-docs.uclv.cu/docker-hub/repos/) 

- With your Dockerfile ready, follow with this command which uses the repo name from your public dockerhub repo: 
```
docker build -t nickgoko/webapp-v1 . 
```

- To check if your image has build perform the command below:
```
docker images
```

- In order to push the image to Dockerhub you need to login using the command below. You will then need to input your Dockerhub account username and password. 
```
docker login
```

- After successfully logging in. Push the image to docker hub
```
docker push nickgoko/webapp-v1
```
- Navigate to your Dockerhub repo to confirm that the push was successful. 

## Version 2

### Objective- A Working docker image deployed on AWS and running on Fargate.
![Alt text](image-2.png)
### Requirements
- Fargate Launch Type
    ![AWS Fargate](image-1.png)
- AWS CLI installed
- Docker Image version 2

#### Step 1
Improve upon the functionality v1 of the web app to a version to. 
Create index.php
Then  build a docker image
```
docker build -t docker-web-app . 
```
#### Step 2
Create a repository in Amazon ECR to house the Docker container image and name it `docker-web-app`
#### Step 3
Once you do that You are now ready to build the container image for the application and push it to the Amazon ECR repository that you created

#### Step 4
Ensure your AWS CLI is installed and updated

#### Step 5
Go back to the **Amazon ECR** console browser tab, and in the message window at the top of the page, choose **View push commands**.
    
The **Push commands for docker-web-app** pop-up window opens. 
- This window lists **four AWS CLI commands** that are customized for the _mb-repo_, and they are purposely built to:
- Authenticate your Docker client to your Amazon ECR registry
    - Build your Docker image
    - Tag your Docker image
    - Push your Docker image to the repository


#### Step 6
Once your repo is pushed and image is on ecr.
Record the _Image URI_. In the **Images** list, locate the **Image URI** of the _latest_ version of the image, and choose the **Copy** icon. Paste the value in a text editor. You will use it in a subsequent step.
#### Step
Create a ECS cluster

#### Step 7
In the navigation pane of the **Amazon ECS** console browser tab, choose **Task Definitions**.  
Choose **Create new Task Definition**.  
In the **Select launch type compatibility** page, choose the **EC2** card.  
Choose **Next step**.  
The **Configure task and container definitions** page opens.  
In the **Task Definition Name** box, enter `webapp-task`.  
Scroll down to **Container Definitions** and choose **Add container**.  
The **Add container** window opens.

Configure the following settings.
- **Container name**: `docker-web-app`
- **Image**: Paste the **Image URI** of the application container image, which you copied to a text editor in a previous step.
- **Memory Limits**: Select _Hard limit_ and enter `256`. (This setting defines the maximum amount of memory that the container is allowed to use.)
- **Port mappings > Container port**: `3000` (This setting specifies the port where the container receives requests. You do not need to enter a value in **Host port**.)  
### Terms
- **Task definition**- specify the parameters for the application and launch type to use.
- **Cluster** - logical grouping of container instances that you can place tasks on. Clusters can contain tasks using the Fargate and EC2 launch type.
- **Service** - Enables you to specify how many copies of the task definition to run and maintain in a cluster. 
- **Task** - an instantiation of a task definition with a cluster. When we create tasks using Amazon ECS we place them in a cluster.
- **Amazon ECR** - makes it easy for developers to store, manage, and deploy Docker container images. In addition, **Amazon ECR** is integrated with **Amazon ECS**, which enables **Amazon ECS** to pull container images directly for production deployments.
- 