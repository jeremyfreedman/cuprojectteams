from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Team(db.Model):
    __tablename__ = "teams"
    name = db.Column(db.Text, primary_key=True)
    img_url = db.Column(db.Text, nullable=True) # can we host images on Google Cloud? Probably.
    description = db.Column(db.Text, nullable=False)
    accomplishments = db.relationship('Accomplishment')

    def __init__(self, **kwargs):
        self.name = kwargs.get('name')
        self.img_url = kwargs.get('img_url')
        self.description = kwargs.get('description')

    def serialize(self):
        return {
            'name': self.name,
            'img_url': self.img_url,
            'description': self.description
        }


class Accomplishment(db.Model):
    __tablename__ = "accomplishments" # projects and awards together?
    team = db.Column(db.Text, db.ForeignKey("team.name"), nullable=False) # index projects by team name
    acc_name = db.Column(db.Text, nullable=False)
    acc_year = db.Column(db.Integer, nullable=False)
    acc_desc = db.Column(db.Text, nullable=True)
    acc_img_url = db.Column(db.Text, nullable=True)

    def __init__(self, **kwargs):
        self.acc_name = kwargs.get('name')
        self.acc_year = kwargs.get('year')
        self.acc_desc = kwargs.get('description')
        self.acc_img_url = kwargs.get('img_url')

    def serialize(self):
        return {
            'name': self.acc_name,
            'year': self.acc_year,
            'description': self.acc_desc,
            'img_url': self.acc_img_url
        }


class Member(db.Model):
    __tablename__ = "members"
    team = db.Column(db.Text, db.ForeignKey('team.name'), nullable=False) # same deal as Project.team
    member_name = db.Column(db.Text, nullable=False)
    member_img_url = db.Column(db.Text, nullable=True) # might be unfeasible to have pictures of these
    # any other info we can think of?


class Social(db.Model):
    __tablename__ = "connect"
    team = db.Column(db.Text, db.ForeignKey('team.name'), nullable=False)
    facebook = db.Column(db.Text)
    twitter = db.Column(db.Text)
    instagram = db.Column(db.Text) # app targets to open links in-app? possible?
    website = db.Column(db.Text)
    git = db.Column(db.Text) 
    email = db.Column(db.Text) # use mailto:
    # any other links we can think of?