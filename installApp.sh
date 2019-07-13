
#clone challenge app
git clone https://github.com/AfterpayTouch/recruitment-challenge-1.git flaskapp
#cd to flaskapp
cd flaskapp
#install requirements
pip3 install -r requirements.txt
#go to the app
cd flaskapp/
#run the app
gunicorn3 tiny_app:app &
