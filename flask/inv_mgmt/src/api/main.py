from flask import Blueprint, jsonify, abort, request
from ..models import User, Location, User_Account, Item, User_Location, db

bp = Blueprint('/', __name__, url_prefix='/')

@bp.route('/', methods=['GET']) #decorator takes path and list of HTTP verbs
def base():
    print("Hello user. Welcome to the Inventory management Database landing page.")
