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
    team = Team.query.filter_by(name=response.get('name')).first()
    if team is None:
        team = Team(
            name = response.get('name'),
            img_url = response.get('img_url'),
            description = response.get('description'),
            category = response.get('category')
        )
        db.session.add(team)
        db.session.commit()
        return json.dumps({'success': True, 'data': team.serialize()}), 201
    return json.dumps({'success': False, 'error': 'Team already exists!'}), 409


@app.route('/api/team/<string:teamname>/')
def get_summary(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        return json.dumps({'success': True, 'data': team.serialize()}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404


@app.route('/api/team/<string:teamname>/accomplishment/', methods=['POST'])
def add_accomplishment(teamname):
    response = json.loads(request.data)
    team = Team.query.filter_by(name=teamname).first()
    if not team is None:
        accomplishment = Accomplishment(
            name = response.get('name'),
            year = response.get('year'),
            description = response.get('description'),
            img_url = response.get('img_url')
        )
        team.accomplishments.append(accomplishment)
        db.session.add(accomplishment)
        db.session.commit()
        return json.dumps({'success': True, 'data': accomplishment.serialize()}), 201
    return json.dumps({'success': False, 'data': 'Team not found!'}), 404    


@app.route('/api/team/<string:teamname>/accomplishments/')
def get_accomplishments(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        accomplishments = [accomplishment.serialize() for accomplishment in team.accomplishments]
        return json.dumps({'success': True, 'data': accomplishments}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404


@app.route('/api/team/<string:teamname>/member/', methods=['POST'])
def add_member(teamname):
    response = json.loads(request.data)
    team = Team.query.filter_by(name=teamname).first()
    if not team is None:
        member = Member(
            name = response.get('name'),
            comment = response.get('comment'),
            img_url = response.get('img_url'),
        )
        team.members.append(member)
        db.session.add(member)
        db.session.commit()
        return json.dumps({'success': True, 'data': member.serialize()}), 201
    return json.dumps({'success': False, 'data': 'Team not found!'}), 404


@app.route('/api/team/<string:teamname>/members/')
def get_members(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        members = [member.serialize() for member in team.members]
        return json.dumps({'success': True, 'data': members}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404


@app.route('/api/team/<string:teamname>/social/', methods=['POST'])
def add_social(teamname):
    response = json.loads(request.data)
    team = Team.query.filter_by(name=teamname).first()
    if not team is None:
        social = Social(
            facebook = response.get('facebook'),
            twitter = response.get('twitter'),
            instagram = response.get('instagram'),
            website = response.get('website'),
            git = response.get('git'),
            email = response.get('email')
        )
        team.socials.append(social)
        db.session.add(social)
        db.session.commit()
        return json.dumps({'success': True, 'data': social.serialize()}), 201
    return json.dumps({'success': False, 'data': 'Team not found!'}), 404


@app.route('/api/team/<string:teamname>/socials/')
def get_socials(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if not team is None:
        socials = [social.serialize() for social in team.socials]
        return json.dumps({'success': True, 'data': socials}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404


@app.route('/api/team/<string:teamname>/tag/', methods=['POST'])
def tag_team(teamname):
    response = json.loads(request.data)
    team = Team.query.filter_by(name=teamname).first()
    if not team is None:
        team.category = response.get('category')
        db.session.commit()
        return json.dumps({'success': True, 'data': team.serialize()}), 201
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404


@app.route('/api/team/<string:teamname>/event/', methods=['POST'])
def add_event(teamname):
    response = json.loads(request.data)
    team = Team.query.filter_by(name=teamname).first()
    if not team is None:
        event = TimelineEvent(
            title = response.get('title'),
            description = response.get('description')
        )
        team.events.append(event)
        db.session.add(event)
        db.session.commit()
        return json.dumps({'success': True, 'data': event.serialize()}), 201
    return json.dumps({'success': False, 'data': 'Team not found!'}), 404


@app.route('/api/team/<string:teamname>/events/')
def get_events(teamname):
    team = Team.query.filter_by(name=teamname).first()
    if team is not None:
        events = []
        for e in team.events:
            events.append(e.serialize())
        return json.dumps({'success': True, 'data': events}), 200
    return json.dumps({'success': False, 'error': 'Team not found!'}), 404


@app.route('/api/tag/<string:tagname>/')
def get_tagged(tagname):
    teams = Team.query.filter_by(category=tagname)
    if not teams is None:
        teams = [team.serialize() for team in teams]
        return json.dumps({'success': True, 'data': teams}), 200
    return json.dumps({'success': False, 'error': 'No such category!'}), 404


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
