from flask import Blueprint, render_template, request, redirect, url_for, get_flashed_messages
from flask.helpers import flash

front = Blueprint('front',__name__)

@front.route('/')
def index():
    print("Ruta principal")
    return "index"

@front.route('/profesor')
def profesor():
    return "profesor"