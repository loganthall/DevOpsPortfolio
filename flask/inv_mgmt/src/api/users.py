from flask import Blueprint, jsonify, abort, request
from ..models import User, Location, User_Account, Item, User_Location, db

bp = Blueprint('users', __name__, url_prefix='/users')

@bp.route('', methods=['GET']) #decorator takes path and list of HTTP verbs
def index():
    users = User.query.all() #ORM performs SELECT query
    result = []
    for u in users:
        result.append(u.serialize()) #build list of users as dictionaries
    return jsonify(result) #return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    u = User.query.get_or_404(id) #checks user table for user id, return 404 if not found
    return jsonify(u.serialize()) #return JSON response of user attributes

@bp.route('', methods=['POST'])
def create():
    #request body must contain users name department, and unique username
    if 'username' not in request.json or 'department' not in request.json or 'name' not in request.json:
        return abort(400, 'All fields are required')

    try: # Check to make sure a user account with the provided name exists and is unique to user
        ua = User_Account.query.get(request.json['username'])
    except:
        return abort(400, 'A User Account must first exist to create a user')
    user_check = User.query.all()
    for user in user_check:
        if user.username == request.json['username']:
            return abort(400, 'User Account must not be tied to another User')

    #construct record
    id_key = len(user_check) + 1 #sets ID to the number that is 1 beyond the current length
    u = User(
        name=request.json['name'],
        department=request.json['department'],
        username=request.json['username']
    )
    u.id = id_key #set proper ID to create

    db.session.add(u) #prepare CREATE statment
    db.session.commit() #execute CREATE statement
    return jsonify('Successfully added', u.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):

    u = User.query.get_or_404(id)
    ua = User_Account.query.get(u.username)

    db.session.delete(ua) #prepare DELETE user account statement, which cascades to user and user_location objects
    db.session.commit() #execute DELETE statement

    return jsonify('Successfully deleted')

@bp.route('/<int:id>', methods=['PATCH','PUT'])
def update(id: int):
    try: #checks if user id exists, returns 404 if not
        u = User.query.get_or_404(id)
    except:
        return abort(400, 'User does not exist')

    if 'name' not in request.json and 'department' not in request.json and 'username' not in request.json: #confirms there is at least one attribute in the request
        return abort(400, 'At least one attribute is require to update')

    if 'name' in request.json: #confirms name is in JSON and updates object
        u.name = request.json['name']

    if 'department' in request.json: #confirms department is in JSON and updates object
        u.department = request.json['department']

    if 'username' in request.json: #confirms username is in JSON, check for uniqueness, and updates object
        try: # Check to make sure a user account with the proivided name exists and is unique to a user
            ua = User_Account.query.get(request.json['username'])
        except:
            return abort(400, 'A User Account must first exist to create a user')
        user_check = User.query.all()
        for user in user_check:
            if user.username == request.json['username']:
                return abort(400, 'User Account must not be tied to another User')
        u.username = request.json['username']

    try: #attempts to commit the changes, returns message on success or fail
        db.session.commit()
        return jsonify('Successful', u.serialize())
    except:
        return jsonify('An error has occurred')
