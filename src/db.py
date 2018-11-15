from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Team(db.Model):
    __tablename__ = "teams"
    name = db.Column(db.Text, primary_key=True)
    img_url = db.Column(db.Text, nullable=True) # can we host images on Google Cloud? Probably.
    description = db.Column(db.Text, nullable=False)
    awards = db.Column(db.Text, nullable=True)


class Project(db.Model):
    __tablename__ = "projects"
    team = db.Column(db.Text, db.ForeignKey('team.name'), nullable=False) # index projects by team name
    proj_name = db.Column(db.Text, nullable=False)
    proj_desc = db.Column(db.Text, nullable=True)
    proj_img_url = db.Column(db.Text, nullable=True)

class Member(db.Model):
    __tablename__ = "members"
    team = db.Column(db.Text, db.ForeignKey('team.name'), nullable=False) # same deal as Project.team
    member_name = db.Column(db.text, nullable=False)
    member_img_url = db.Column(db.text, nullable=True) # might be unfeasible to have pictures of these
    # any other info we can think of?