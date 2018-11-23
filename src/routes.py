import json
from db import db, Post, Comment
from flask import Flask, request

db_filename = "data.db"
app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db.init_app(app)
with app.app_context():
    db.create_all()
    
@app.route('/')
@app.route('/api/teams/')
def get_teams():
    teams = Team.query.all()
    res = {'success': True, 'data': [team.serialize() for team in teams]} 
    return json.dumps(res), 200

@app.route('/api/team/<str:teamname>/summary/')
def get_summary(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        return json.dumps({'success': True, 'data': team.serialize()}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404

@app.route('/api/team/<str:teamname>/accomplishments/')
def get_accomplishments(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        accomplishments = [accomplishments.serialize()]
        return json.dumps({'success': True, 'data': accomplishments}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404

#todo: members, socials