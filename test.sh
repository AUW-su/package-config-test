#!/bin/sh

set -e

# set -v on # 显示命令执行回显

# export NODE_VERSION=10.15.0

# . ~/.nvm/nvm.sh

# nvm install ${NODE_VERSION}
# NPM="nvm exec 10.15.0 npm"

# ${NPM} install --registry https://registry.npm.taobao.org
npm install --registry https://registry.npm.taobao.org

####################

# 获取配置文件
fileName="package-config-test"

gitcloneurl="https://github.com/AUW-su/package-config-test.git"

rm -rf "./${fileName}"

git clone "$gitcloneurl"

#  chmod u+x *.sh

# 判断配置文件是否有内容，在[   ]内要有空格
if [ -s "./${fileName}/.config" ]; then

    echo "文件有内容"

    # 开始读配置文件
    cat "./${fileName}/.config" | while read line

    do
    if [[ $line =~ "all" ]]; then
        echo $line

        IFS=":"

        array=($line)

        echo ${array[1]}

        npm install ${array[1]}  --registry https://registry.npm.taobao.org
    fi
    done

fi

rm -rf "./${fileName}"

# package diff 提交
