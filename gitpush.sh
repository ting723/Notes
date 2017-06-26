#!/usr/bin/bash
echo $1
if [ -z $1 ];then
    echo "必须输入commit信息!!!!"
    exit 0
fi
git pull
git add -A
git commit -a -m "$1"
git push
echo "提交成功"
