from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Location(db.Model):
    __tablename__ = 'locations'
    name = db.Column(db.String(128), primary_key=True)

    def __init__(self, name: str):
        self.name = name

    def serialize(self):
        return {
            'name': self.name
        }

class User_Account(db.Model):
    __tablename__ = 'user_accounts'
    username = db.Column(db.String(64), primary_key=True)
    password = db.Column(db.String, nullable=False)

    def __init__(self, username: str, password: str):
        self.username = username
        self.password = password

    def serialize(self):
        return {
            'username': self.username,
            'password': self.password
        }

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.SmallInteger, primary_key=True, autoincrement=True)
    name = db.Column(db.String(32), nullable=False)
    department = db.Column(db.String(64), nullable=False)
    username = db.Column(db.String(64), db.ForeignKey('user_accounts.username', ondelete='CASCADE'), unique=True, nullable=False)

    def __init__(self, name: str, department: str, username: str):
        self.name = name
        self.department = department
        self.username = username

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'department': self.department,
            'username': self.username
        }

class Item(db.Model):
    __tablename__ = 'items'
    id = db.Column(db.SmallInteger, primary_key=True, autoincrement=True)
    item_name = db.Column(db.String, unique=True)
    lifespan = db.Column(db.SmallInteger)
    general_name = db.Column(db.String, nullable=False)
    consumable_peripheral = db.Column(db.Boolean, default=False)
    cost = db.Column(db.Numeric)
    assigned_user = db.Column(db.SmallInteger, db.ForeignKey('users.id', ondelete="SET NULL"))

    def __init__(self, item_name: str, lifespan: int, assigned_user: int, consumable_peripheral: bool, cost, general_name: str):
        self.item_name = item_name
        self.lifespan = lifespan
        self.general_name = general_name
        self.consumable_peripheral = consumable_peripheral
        self.cost = cost
        self.assigned_user = assigned_user

    def serialize(self):
        return {
            'id': self.id,
            'item_name': self.item_name,
            'lifespan': self.lifespan,
            'general_name': self.general_name,
            'consumable_peripheral': self.consumable_peripheral,
            'cost': str(self.cost),
            'assigned_user': self.assigned_user
        }

#bridge table for items and locations tables
class User_Location(db.Model):
    __tablename__ = 'users_locations'
    id = db.Column(db.SmallInteger, autoincrement=True, primary_key=True)
    users_id = db.Column(db.SmallInteger, db.ForeignKey('users.id', ondelete="CASCADE"), nullable=False)
    locations_name = db.Column(db.String, db.ForeignKey('locations.name', ondelete="CASCADE"), nullable=False)

    def __init__(self, users_id: int, locations_name: str):
        self.users_id = users_id
        self.locations_name = locations_name

    def serialize(self):
        return {
            'id': self.id,
            'users_id': self.users_id,
            'locations_name': self.locations_name,
        }
