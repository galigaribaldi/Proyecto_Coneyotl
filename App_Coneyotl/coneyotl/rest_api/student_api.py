from flask.views import  MethodView
from flask import request
from coneyotl import app
import json
class Student(MethodView):
    def get(self):
        c = {
            'code': 201,
            'message': "Nuevo"
            }
        print(c)
        return c
    def post(self):
        return "Post"
    
    def delete(self):
        return "DELETE"
    
    def put(self):
        return "PUT"

student_view = Student.as_view('student_view')
app.add_url_rule(
    '/apiConeyotl/student/',
    view_func=student_view,
    methods = ['GET', 'POST']
    )