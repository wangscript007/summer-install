#!/bin/bash

cd ~

# 更新系统
apt update && apt upgrade -y

# 必备软件
apt install git -y
apt install htop
apt install docker.io -y

# 获取脚本
git clone https://gitee.com/jayun_site/summer-install.git

# 构建镜像
cd ~/summer-install/docker/factory
sh build.sh

# 拷贝脚本
cp -r ~/summer-install/docker/factory/tools/*.sh ~

# 创建容器
cd ~

sh create.sh app8101 8101

sh create.sh app8101 8102

echo "应用环境初始化完成，请根据项目实际情况酌情修改 update.sh"