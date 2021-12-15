#!/bin/bash
WORK_PATH='/home/projects/vue-back2'
cd $WORK_PATH
echo "先清除老代码"
git reset --hard origin/main
git clean -f
echo "拉去最新代码"
git pull origin main
echo "开始构建"
docker build -t vue-back2 .
echo "停止酒容器并删除酒容器"
docker stop vue-back-container
docker rm vue-back-container
echo "新容器"
docker run -p 3000:3000 --name vue-back-container -d vue-back2
