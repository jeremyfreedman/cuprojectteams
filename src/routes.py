import json
from db import *
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

@app.route('/api/team/', methods=['POST'])
def add_team():
    response = json.loads(request.data)
    team = Team(
        name = response.get('name'),
        img_url = response.get('img_url'),
        description = response.get('description')
    )
    print(team.serialize())
    db.session.add(team)
    db.session.commit()
    return json.dumps({'success': True, 'data': team.serialize()}), 201

@app.route('/api/team/<string:teamname>/summary/')
def get_summary(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        return json.dumps({'success': True, 'data': team.serialize()}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404

@app.route('/api/team/<string:teamname>/accomplishments/')
def get_accomplishments(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        accomplishments = [accomplishment.serialize() for accomplishment in accomplishments]
        return json.dumps({'success': True, 'data': accomplishments}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404

@app.route('/api/team/<string:teamname>/members/')
def get_members(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        members = [member.serialize() for member in members]
        return json.dumps({'success': True, 'data': members}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404

@app.route('/api/team/<string:teamname>/socials/')
def get_socials(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        socials = [social.serialize() for social in socials]
        return json.dumps({'success': True, 'data': socials}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
