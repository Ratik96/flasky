read -p "Application name: " app_name
mkdir $app_name
echo "========= Added main directory ========="
read -p "Do you want to setup a virtualenv? (y/n) " venv
if [ $venv = "y" ]; then
   mkdir flask
  cd flask
  virtualenv .
  source bin/activate
  pip install flask
  cd ../
  echo "========= Flask installed ========="
fi
cd $app_name
touch runserver.py
printf 'from %s import app' $app_name >> runserver.py
echo "========= Added runserver.py ========="
mkdir $app_name
cd $app_name
touch __init__.py views.py
printf 'from flask import Flask\napp = Flask(__name__)\n\nfrom %s import views' $app_name>> __init__.py
printf 'from %s import app\n\n@app.route("/"")\ndef index():\n\treturn "Hello World!"' $app_name>> views.py
echo "========= __init__ and views.py added ========="
mkdir static
mkdir templates
echo "========= Tasks completed successfully. Happy Coding! ========= "