from flask import Flask
from flask import render_template, request, flash
from flask import redirect, url_for
#import models as coneccion
#import sqlite3

app = Flask(__name__)

### Settings
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/registroEstudiante')
def registroEstudiante():
    return render_template('registroEst.html')

if __name__ == '__main__':
    app.run(debug = True)