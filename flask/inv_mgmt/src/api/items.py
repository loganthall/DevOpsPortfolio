from flask import Blueprint, jsonify, abort, request
from ..models import User, Location, User_Account, Item, User_Location, db

bp = Blueprint('items', __name__, url_prefix='/items')

@bp.route('', methods=['GET']) #decorator takes path and list of HTTP verbs
def index():
    items = Item.query.all() #ORM performs SELECT query
    result = []
    for i in items:
        result.append(i.serialize()) #build list of items as dictionaries
    return jsonify(result) #return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    i = Item.query.get_or_404(id) #checks items table for item id, return 404 if not found
    return jsonify(i.serialize()) #return JSON response of item attributes

#
@bp.route('', methods=['POST'])
def create():
    #request body must contain general_name
    if 'general_name' not in request.json:
        return abort(400, 'At least general_name required')

    id_key = len(Item.query.all()) + 101 #sets ID to the number that is 1 beyond the current length, since the ID started at 101

    general_name = request.json['general_name']
    assigned_user = None
    item_name = None
    lifespan = 0
    consumable_peripheral = 0
    cost = 0

    if 'assigned_user' in request.json:
        try: # Check to make sure a user with the provided id exists
            u = User.query.get(request.json['assigned_user'])
            assigned_user = request.json['assigned_user']
        except:
            return abort(400, 'A User must first exist to assign an item to them')

    if 'item_name' in request.json: #confirms item_name is in JSON and updates object
        item_check = Item.query.all()
        for item in item_check:
            if item.item_name == request.json['item_name']:
                return abort(400, 'Item names must be unique')
        item_name = request.json['item_name']

    if 'lifespan' in request.json: #confirms lifespan is in JSON and updates object
        lifespan = request.json['lifespan']

    if 'consumable_peripheral' in request.json: #confirms consumable_peripheral is in JSON and updates object
        consumable_peripheral = request.json['consumable_peripheral']

    if 'cost' in request.json: #confirms cost is in JSON and updates object
        cost = request.json['cost']

     #construct initial record
    i = Item(
        item_name,
        lifespan,
        assigned_user,
        consumable_peripheral,
        cost,
        general_name
    )

    i.id = id_key #set proper ID to create

    db.session.add(i) #prepare CREATE statment

    try:
        db.session.commit() #execute CREATE statement
        return jsonify('Successfully added', i.serialize())
    except:
        return abort(400, "Another error has occurred")

@bp.route('/<int:id>', methods=['PATCH','PUT'])
def update(id: int):
    try: #checks if username exists, returns 404 if not
        i = Item.query.get_or_404(id)
    except:
        return abort(400, 'Item does not exist')

    if 'item_name' in request.json: #confirms whether item_name is in JSON, and updates attribute
        item_check = Item.query.all()
        for item in item_check:
            if item.item_name == request.json['item_name']:
                return abort(400, 'Item names must be unique')
        i.item_name = request.json['item_name']

    if 'lifespan' in request.json: #confirms whether lifespan is in JSON, and updates attribute
        i.lifespan = request.json['lifespan']

    if 'assigned_user' in request.json: #confirms whether assigned_user is in JSON, and updates attribute
        try: # Check to make sure a user with the provided id exists
            u = User.query.get_or_404(request.json['assigned_user'])
        except:
            return abort(400, 'A User must first exist to assign an item to them')

        i.assigned_user = request.json['assigned_user']

    if 'consumable_peripheral' in request.json: #confirms whether consumable_peripheral is in JSON, and updates attribute
        i.consumable_peripheral = request.json['consumable_peripheral']

    if 'cost' in request.json: #confirms whether cost is in JSON, and updates attribute
        i.cost = request.json['cost']

    if 'general_name' in request.json: #confirms whether general_name is in JSON, and updates attribute
        if request.json['general_name'] == '' or request.json['general_name'] == None:
            return abort(400, "general_name cannot be blank")
        i.general_name = request.json['general_name']

    try: #attempts to commit the changes, returns message on success or fail
        db.session.commit()
        return jsonify('Successful', i.serialize())
    except:
        return abort(400, 'An error has occurred')
