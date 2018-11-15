from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Team(db.Model):
    __tablename__ = "team"
    name = db.Column(db.Text, primary_key=True)
    img_url = db.Columb(db.Text, nullable=True) # can we host images on Google Cloud? 