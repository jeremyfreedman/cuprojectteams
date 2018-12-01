from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()

class Team(db.Model):
    __tablename__ = "team"
    name = db.Column(db.Text, primary_key=True)
    img_url = db.Column(db.Text, nullable=True) # can we host images on Google Cloud? Probably.
    description = db.Column(db.Text, nullable=False)
    accomplishments = db.relationship('Accomplishment')
    members = db.relationship('Member')
    socials = db.relationship('Social')
    category = db.Column(db.Text, db.ForeignKey("category.category"))

    def __init__(self, **kwargs):
        self.name = kwargs.get('name')
        self.img_url = kwargs.get('img_url')
        self.description = kwargs.get('description')
        self.category = kwargs.get('category')

    def serialize(self):
        return {
            'name': self.name,
            'img_url': self.img_url,
            'description': self.description,
            'category': self.category
        }


class Accomplishment(db.Model):
    __tablename__ = "accomplishment" # projects and awards together?
    acc_id = db.Column(db.Integer, primary_key=True)
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
    __tablename__ = "member"
    member_id = db.Column(db.Integer, primary_key=True)
    team = db.Column(db.Text, db.ForeignKey('team.name'), nullable=False) # same deal as Project.team
    member_name = db.Column(db.Text, nullable=False)
    member_comment = db.Column(db.Text, nullable=True)
    member_comment_datetime = db.Column(db.DateTime, default=db.func.current_timestamp())
    member_img_url = db.Column(db.Text, nullable=True) # might be unfeasible to have pictures of these
    # any other info we can think of?

    def __init__(self, **kwargs):
        self.member_name = kwargs.get('name')
        self.member_comment = kwargs.get('comment')
        self.member_comment_datetime = db.func.current_timestamp()
        self.member_img_url = kwargs.get('img_url')

    def serialize(self):
        return {
            'name': self.member_name,
            'comment': self.member_comment,
            'datetime': str(self.member_comment_datetime),
            'img_url': self.member_img_url
        }


class Social(db.Model):
    __tablename__ = "social"
    social_id = db.Column(db.Integer, primary_key=True)
    team = db.Column(db.Text, db.ForeignKey('team.name'), nullable=False)
    facebook = db.Column(db.Text)
    twitter = db.Column(db.Text)
    instagram = db.Column(db.Text) # app targets to open links in-app? possible?
    website = db.Column(db.Text)
    git = db.Column(db.Text) 
    email = db.Column(db.Text) # use mailto:
    # any other links we can think of?

    def __init__(self, **kwargs):
        self.facebook = kwargs.get('facebook')
        self.twitter = kwargs.get('twitter')
        self.instagram = kwargs.get('instagram')
        self.website = kwargs.get('website')
        self.git = kwargs.get('git')
        self.email = kwargs.get('email')

    def serialize(self):
        return {
            'facebook': self.facebook,
            'twitter': self.twitter,
            'instagram': self.instagram,
            'website': self.website,
            'git': self.git,
            'email': self.email
        }

<<<<<<< HEAD
class Category(db.Model):
    __tablename__ = "category"
    category = db.Column(db.Text, primary_key=True, nullable=False)
    teams = db.relationship('Team')

    def __init__(self, **kwargs):
        self.category = kwargs.get('category')

    def serialize(self):
        return {
            [teams]
        }
=======
class TimelineEvent(db.Model):
    __tablename__ = 'timeline_event'
    event_id = db.Column(db.Integer, primary_key = True)
    team = db.Column(db.Text, db.ForeignKey('team.name'), nullable =False)
    title = db.Column(db.Text)
    description = db.Column(db.Text)

    def __init__(self, **kwargs):
        self.title = kwargs.get('title')
        self.description = kwargs.get('description')

    def serialize(self):
        return {
            'title': self.title
            'description': self.description
        }
        
#class Category(db.Model):
    #__tablename__ = 
    #pass
>>>>>>> b796a81ac5d6dbfcd16c4a71d5cc92ecf0603421
