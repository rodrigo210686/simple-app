#!/bin/bash
cd /tmp/simple-app
docker build -t simple-web-app .
ECR_REPO=$(aws ecr describe-repositories --region us-east-1 --repository-names survey-app-repo --query 'repositories[*].repositoryUri' --output text | cut -d'/' -f1)
ECR_PATH=$(aws ecr describe-repositories --region us-east-1 --repository-names survey-app-repo --query 'repositories[*].[repositoryUri]' --output text)
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REPO
docker tag simple-web-app:latest $ECR_PATH:latest
docker push $ECR_PATH:latest
