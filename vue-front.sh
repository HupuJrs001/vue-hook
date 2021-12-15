#!bin/bash
WORK_PATH="/home/projects/vue-front2"
CD WORK_PATH
echo "先清除老代码"
git reset --hard origin/master
git clean -f
echo "在拉去新代码"
git pull origin master
echo "编译"
npm run build
echo "开始构建镜像"
docker build -t vue-front:1.0 .
echo "停止酒容器"
docker stop vue-front-container
echo "删除酒容器"
docker rm vue-front-container
echo "创建新勇气"
docker run -p 8080:80 --name vue-front-container -d vue-front:1.0


