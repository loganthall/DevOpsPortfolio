from flask import Blueprint, jsonify, abort, request
from ..models import User, Location, User_Account, Item, User_Location, db

bp = Blueprint('users_locations', __name__, url_prefix='/users_locations')

@bp.route('', methods=['GET']) #decorator takes path and list of HTTP verbs
def index():
    users = User_Location.query.all() #ORM performs SELECT query
    result = []
    for u in users:
        result.append(u.serialize()) #build list of user locations as dictionaries
    return jsonify(result) #return JSON response

@bp.route('/<int:user_id>', methods=['GET'])
def show(user_id: int):
    users = User_Location.query.all() #pulls all records from users_locations table
    result = []
    for u in users: #iterates through each record and checks the users_id value against the provided value
        if u.users_id == user_id:
            result.append(u.serialize()) #build list of user locations as dictionaries
    return jsonify(result) #return JSON response of user locations

@bp.route('', methods=['POST'])
def create():
    #request body must contain users_id and locations_name
    if 'users_id' not in request.json or 'locations_name' not in request.json:
        return abort(400)

    users = User_Location.query.all()
    for user in users:
        if user.users_id == request.json['users_id'] and user.locations_name == request.json['locations_name']:
            return abort(400, 'User and Location record already exists.')

    #construct record
    u = User_Location(
        users_id=request.json['users_id'],
        locations_name=request.json['locations_name']
    )

    db.session.add(u) #prepare CREATE statment
    try:
        db.session.commit() #execute CREATE statement
        return jsonify('Successfully added', u.serialize())
    except:
        return abort(400, 'User ID or Location does not exist.')

@bp.route('/user/<int:user_id>', methods=['DELETE']) #delete all locations of a certian user
def delete_user(user_id: int):
    user_loc_records = User_Location.query.all()
    num_records = 0
    try: #try to pull the records of the user ID provided and perform the delete
        for record in user_loc_records:
            if record.users_id == user_id:
                num_records += 1
                db.session.delete(record) #prepare DELETE statement
        if num_records == 0: return abort(400, 'Username does not exist, or another error has occurred')
        db.session.commit() #execute DELETE statement
        return jsonify('Successfully deleted ' + str(num_records) + ' records.')
    except: #if user ID does not exist, return error
        return abort(400, 'Username does not exist, or another error has occurred')

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    try: #try to pull the ID provided and perform the delete
        u = User_Location.query.get(id)
        db.session.delete(u) #prepare DELETE statement
        db.session.commit() #execute DELETE statement
        return jsonify('Successfully deleted')
    except: #if ID does not exist, return error
        return abort(400, 'ID does not exist, or another error has occurred')
