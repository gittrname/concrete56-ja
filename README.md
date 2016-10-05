concrete56-ja
================

chriswayg/apache-phpをベースに作成した

concrete5.6 日本語版Dockerコンテナを作成するDockerfileです。

###Usage:

git clone http://git.ranran.mydns.jp/ranpei/concrete56-ja.git

docker build -t concrete56-ja concrete56-ja

docker run -d --name pdns -p 80:80 -p 443:443 concrete56-ja:latest
