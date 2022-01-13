import os
class BaseConfig(object):
    """Baseconfig

    Parameters
    ----------
    object : [type]
        [description]
    """
    SECRET_KEY = 'Key'
    DEBUG = True
    TESTING = False
    PORT=8000
    DATABASE_URL = os.environ.get('HEROKU_POSTGRESQL_BLUE_URL')
    #SQLALCHEMY_DATABASE_URI = "postgresql+psycopg2://postgres:postgress@localhost:5432/pyalmacen"
    SQLALCHEMY_TRACK_MODIFICATIONS = False

class ProductionConfig(BaseConfig):
    'Produccion configuracion'
    DEBUG = False
    
class DevelopmentConfig(BaseConfig):
    'Desarrollo configuracion'
    DEBUG = True
    TESTING = True
    SECRET_KEY = 'Desarrollo key'