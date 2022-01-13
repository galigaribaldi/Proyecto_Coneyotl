from flask import Flask,redirect,url_for
from coneyotl.front.front_controller import front
app = Flask(__name__)

###Api Rest
from coneyotl.rest_api.student_api import student_view

app.register_blueprint(front)