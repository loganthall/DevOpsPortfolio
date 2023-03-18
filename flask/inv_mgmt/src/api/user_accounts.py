from flask import Blueprint, jsonify, abort, request
from ..models import User, Location, User_Account, Item, User_Location, db
import hashlib
import secrets

def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()

bp = Blueprint('user_accounts', __name__, url_prefix='/user_accounts')

@bp.route('', methods=['GET']) #decorator takes path and list of HTTP verbs
def index():
    usernames = User_Account.query.all() #ORM performs SELECT query
    result = []
    for u in usernames:
        result.append(u.serialize()) #build list of usernames as dictionaries
    return jsonify(result) #return JSON response

@bp.route('/<username>', methods=['GET'])
def show(username):
    u = User_Account.query.get_or_404(username) #checks user_accounts table for username, return 404 if not found
    return jsonify(u.serialize()) #return JSON response of user account attributes

@bp.route('', methods=['POST'])
def create():
    #request body must contain username and password
    if 'username' not in request.json or 'password' not in request.json:
        return abort(400)

    #check for password and username length requirement
    if len(request.json['username']) < 3 or len(request.json['password']) < 8:
        return abort(400)

    #construct record
    u = User_Account(
        username=request.json['username'],
        password=scramble(request.json['password'])
    )
    db.session.add(u) #prepare CREATE statment
    try: #attempt to commit the provided credentials into the db
        db.session.commit() #execute CREATE statement
        return jsonify('Successfully added', u.serialize())
    except:#if username already exists, return error
        return abort(400, 'Username already exists, or another error has occurred.')

@bp.route('/<username>', methods=['DELETE'])
def delete(username):
    try: #try to pull the user account provided and perform the delete
        u = User_Account.query.get(username)
        db.session.delete(u) #prepare DELETE statement
        db.session.commit() #execute DELETE statement
        return jsonify('Successfully deleted')
    except: #if user account does not exist, return error
        return abort(400, 'Username does not exist, or another error has occurred')

@bp.route('/<username>', methods=['PATCH','PUT'])
def update(username):
    try: #checks if username exists, returns 404 if not
        u = User_Account.query.get_or_404(username)
    except:
        return abort(400, 'Username does not exist')

    if 'username' not in request.json and 'password' not in request.json: #confirms there is a username or password in the JSON
        return abort(400)

    if 'username' in request.json: #confirms username is at least 3 characters and adds new username to the object
        if(len(request.json['username'])) < 3:
            return abort(400, 'Username too short')
        u.username = request.json['username']

    if 'password' in request.json: #confirms password is at least 3 characters and adds new password to the object
        if (len(request.json['password'])) < 8:
            return abort(400, 'Password too short')
        u.password = scramble(request.json['password'])

    try: #attempts to commit the changes, returns message on success or fail
        db.session.commit()
        return jsonify('Successful', u.serialize())
    except:
        return jsonify('An error has occurred')
