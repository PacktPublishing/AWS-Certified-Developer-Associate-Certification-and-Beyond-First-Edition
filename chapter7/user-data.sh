#!/bin/bash

AWS_REGION=us-east-1
SECRET_NAME=[Secret Name]
DB_HOST=[Database Endpoint]
DB_PORT=3306

yum update -y
aws s3 cp s3://[S3 Bucket Name]/todo-plus-nodejs.zip /var
unzip /var/todo-plus-nodejs.zip -d /var
cd /var/todo-plus-nodejs
npm install
npm run build

echo "export AWS_REGION=$AWS_REGION" >> ~/.bashrc
echo "export SECRET_NAME=$SECRET_NAME" >> ~/.bashrc
echo "export DB_HOST=$DB_HOST" >> ~/.bashrc
echo "export DB_PORT=$DB_PORT" >> ~/.bashrc
source ~/.bashrc
pm2 start dist/main.js
