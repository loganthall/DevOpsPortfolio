from flask import Blueprint, jsonify, abort, request
from ..models import User, Location, User_Account, Item, User_Location, db

bp = Blueprint('locations', __name__, url_prefix='/locations')

@bp.route('', methods=['GET']) #decorator takes path and list of HTTP verbs
def index():
    location = Location.query.all() #ORM performs SELECT query
    result = []
    for l in location:
        result.append(l.serialize()) #build list of locations as dictionaries
    return jsonify(result) #return JSON response

@bp.route('', methods=['POST'])
def create():
    #request body must contain location name
    if 'name' not in request.json:
        return abort(400, 'Location name required in request.')

    location = Location.query.all() #querying all location records to check for duplicates
    for l in location:
        if l.name == request.json['name']:
            return abort(400, 'Location record already exists.')

    l = Location(name=request.json['name']) #construct record

    db.session.add(l) #prepare CREATE statment
    try:
        db.session.commit() #execute CREATE statement
        return jsonify('Successfully added', l.serialize())
    except:
        return abort(400)

@bp.route('/<name>', methods=['DELETE'])
def delete(name: str):
    try: #try to pull the name provided and perform the delete
        l = Location.query.get(name)
        db.session.delete(l) #prepare DELETE statement
        db.session.commit() #execute DELETE statement
        return jsonify('Successfully deleted')
    except: #if ID does not exist, return error
        return abort(400, 'Location does not exist, or another error has occurred')

@bp.route('/<name>', methods=['PATCH','PUT'])
def update(name: str):
    if 'name' not in request.json: #confirms there is a location name in the JSON
        return abort(400, 'Location name required for update.')

    try: #checks if location name exists, returns error if not
        l = Location.query.get(name)
    except:
        return abort(400, 'Location does not exist')

    nl = Location(name=request.json['name']) #construct new record and add to session
    db.session.add(nl)

    # update bridge table values
    user_loc_records = User_Location.query.all()
    for record in user_loc_records:
        if record.locations_name == name:
            record.locations_name = request.json['name']

    db.session.delete(l) # delete original name record

    try: #attempts to commit the changes, returns message on success or fail
        db.session.commit()
        return jsonify('Successful')
    except:
        return jsonify('An error has occurred')
