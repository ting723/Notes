## mongodb 常用命令:
1. 登录
mongo ip:port/db -uusername -ppassword

2. 创建db
db.createCollection('db_name');

db.createCollection(name, {capped: <Boolean>, autoIndexId: <Boolean>, size: <number>, max <number>} )
name:集合的名字
capped:是否启用集合限制，如果开启需要制定一个限制条件，默认为不启用，这个参数没有实际意义
size:限制集合使用空间的大小，默认为没有限制
max:集合中最大条数限制，默认为没有限制
autoIndexId:是否使用_id作为索引，默认为使用(true或false)
size的优先级比max要高

常用方法介绍：
1、一般来说，我们创建集合用db.createCollection(name),如：db.createCollection("log"),创建一个名字为log的集合，没有任何的大小，数量限制，使用_id作为默认索引；
2、限制集合空间的大小：db.createCollection("log",{size:1024})或db.createCollection("log",{capped:true,size:1024}),
创建一个名字为log集合，限制它的空间大小为1M，如果超过1M的大小，则会删除最早的记录；
3、限制集合的最大条数：db.createCollection("log",{max:1024})，创建一个名字为log集合，最大条数为1024条，
超过1024再插入数据的话会删除最早的一条记录。这个不能使用capped:true，否则会报错；
4、即限制最大条数有限制使用空间大小：db.createCollection("log",{size:1024,max:1024})或db.createCollection("log",{capped:true,size:1024,max:1024})，
限制集合最大使用空间为1M，最大条数为1024条


3. Ubuntu 16.04 mongodb 安装启动
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

sudo service mongod start
sudo service mongod stop
sudo service mongod restart

// 卸载步骤
sudo service mongod stop
sudo apt-get purge mongodb-org*
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb

4. mongo授权
```
db.createUser(
	{
		user: "test",
		pwd: "test",
		roles: [ { role: "dbAdmin", db: "databasename" } ]
	}
)
```

db.createUser(
	{
		user: "zly",
		pwd: "zly",
		roles: [ { role: "dbAdmin", db: "zlydata" } ]
	}
)

5. 查找
db.collection.find( { qty: { $gt: 20 } } )
