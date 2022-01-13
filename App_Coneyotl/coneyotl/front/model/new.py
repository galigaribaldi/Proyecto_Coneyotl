from decimal import Decimal
from flask_wtf import FlaskForm
from wtforms import StringField, DecimalField
from wtforms.validators import InputRequired, NumberRange

class CategoryForm(FlaskForm):
    name = StringField("Nombre", validators=[InputRequired()])
    Id = DecimalField('Id')