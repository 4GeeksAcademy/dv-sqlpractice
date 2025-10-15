import os
from flask_admin import Admin
from models import db
from flask_admin.contrib.sqla import ModelView


def setup_admin(app):
    app.secret_key = os.environ.get('FLASK_APP_KEY', 'sample key')
    app.config['FLASK_ADMIN_SWATCH'] = 'cerulean'

    # Add your models here, for example this is how we add a the User model to the admin
    admin = Admin(app, name='4Geeks Admin', template_mode='bootstrap3')
    # admin.add_view(ModelView(Country, db.session))
    # admin.add_view(ModelView(Manufacturer, db.session))
    # admin.add_view(ModelView(DevelopmentCompany, db.session))
    # admin.add_view(ModelView(Platform, db.session))
    # admin.add_view(ModelView(VideoGame, db.session))

    # You can duplicate that line to add mew models
    # admin.add_view(ModelView(YourModelName, db.session))
