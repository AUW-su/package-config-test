# 维护一份配置

这个仓库主要是维护一份配置 .config文件，配置的内容是集群中的某个依赖需要安装的版本。

# 原因

基于npm & package.json & package-lock.json的关系，我们需要使用package-lock.json来减少依赖安装的时间，

但是如果要安装package-lock.json锁定版本外的版本（升级或者降级），这时候lock文件就限制了。

所以我们希望有一份配置，在工程打包编译时，能够主动的去修改相关依赖包的版本，以及同步更改lock文件。


## 配置文件格式 如下

all:react@16.0.0

all:vue@2.0.0

beidian_m:koa-etag@2.1.1

### 1、集群名:依赖包@版本

例如 beidian_m:koa-etag@2.1.1

注意：

1）安装多个包的时候 就分多行写，不能放在一行，脚本执行会报错 npm ERR! code EINVALIDTAGNAME

2）要带上版本号，这样的话 依赖升级和降级都能生效。如果不带版本号的话，那么安装时只会安装package.json文件中该依赖包的大版本允许范围内的最新版本

### 2、如果是多有集群都要安装的依赖，则 集群名 换成 all

例如 all:vue@2.0.0


