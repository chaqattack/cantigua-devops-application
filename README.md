# cantigua-devops-application
Devops test solution repo



devops-test-app

A basic NodeJs backend application created for the devops test.

General description

The application consist in two general endpoints, these are GET /users and GET /files. The first endpoint retrieves all the registers of users stored in a postgreSQL database, and the second one list all the files that are stored in a S3 bucket. The rest of the endpoint are for ensuring application health and rediness

For local deployment:
cd devops-test-app-users
docker-compose up
make sure you have the ports 3081 and 5432 available

open this address in your browser to test the app https://localhost:3081/health

now you can access the endpoint /users /version /readdy

Use:
load the template.json to create the infrastructure using cloud Formation

this is an CI/CD DevOps automation using github, travis, docker and aws Elastick Beanstalk




