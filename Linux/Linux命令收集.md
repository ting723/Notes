# 1. Ubuntu 安装命令

```
apt-get install xxx
apt-get update 
apt-get upgrade
// 自动删除无用软件
apt-get autoremove
dpkg -i xxx.deb
// -f 强制 --fix-missing 修复
sudo apt-get install -f -y  xxx --fix-missing

// 更新时不使用无缓存
sudo apt -o Acquire::https::No-Cache=True -o Acquire::http::No-Cache=True update

```

# 2. Linux版本查看

```
lsb_release -a
```

# 3. Ubuntu 导入公钥

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  6AF0E1940624A220
```


# 4. Ubuntu 版本升级

```
do-release-upgrade
```


# 5. 更改用户密码

```
passwd username
-- 需要是root用户,如果是修改root,不需要username
```

# 6. 后台启动

```bash
nohup command  >xx_std.out 2>&1 &
```
