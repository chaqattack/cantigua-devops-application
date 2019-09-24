# install AWS SDK
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin

# install necessary dependency for ecs-deploy
add-apt-repository ppa:eugenesan/ppa
apt-get update
apt-get install jq -y

# install ecs-deploy
curl https://raw.githubusercontent.com/silinternational/ecs-deploy/master/ecs-deploy | \
  sudo tee -a /usr/bin/ecs-deploy
sudo chmod +x /usr/bin/ecs-deploy

# login AWS ECR
# eval $(aws ecr get-login --region us-east-1)

# or login DockerHub
docker login --username $DOCKER_HUB_USER --password $DOCKER_HUB_PSW

# build the docker image and push to an image repository
docker build -t chaqattack/devops-files-app --build-arg AWS_ACCESS_KEY=$AWS_ACCESS_KEY --build-arg AWS_SECRET_KEY=$AWS_SECRET_KEY --build-arg AWS_USER_BUCKET_NAME=$AWS_USER_BUCKET_NAME --build-arg AWS_REGION=$AWS_REGION --build-arg ENV=$ENV ./devops-test-app-files
docker tag chaqattack/devops-files-app:latest $IMAGE_REPO_URL:latest
docker push $IMAGE_REPO_URL:latest

#docker build -t chaqattack/devops-users-app --build-arg DB_USERNAME=$DB_USERNAME --build-arg DB_PASSWORD=$DB_PASSWORD --build-arg DB_NAME=$DB_NAME --build-arg DB_HOST=$DB_HOST --build-arg DB_ENV=$DB_ENV ./devops-test-app-users
#docker tag chaqattack/devops-users-app:latest $IMAGE_REPO_URL:latest
#docker push $IMAGE_REPO_URL:latest

# update an AWS ECS service with the new image
ecs-deploy -c $CLUSTER_NAME -n $SERVICE_NAME -i $IMAGE_REPO_URL:latest