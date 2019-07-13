sudo apt-get install ntp -y

sudo apt-get install telnet -y

sudo apt-get install mtr -y

sudo apt-get install nginx -y

sudo apt-get install python3-pip

sudo pip3 install flask -y

sudo apt-get install gunicorn3 -y

sudo echo '*         hard    nofile      65535' >> /etc/security/limits.conf

sudo echo '*         soft    nofile      65535' >> /etc/security/limits.conf

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1

sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1



#clone challenge app
git clone https://github.com/AfterpayTouch/recruitment-challenge-1.git flaskapp

#cd to flaskapp
cd flaskapp

#install requirements
pip3 install -r requirements.txt

#go to the app
cd /flaskapp

#run the app
gunicorn3 tiny_app:app &
