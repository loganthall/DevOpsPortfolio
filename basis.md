Basic Inventory Management Database

Should do the following:
User Login
Non-editable unless "logged in"
Provide name of logged in User at every interaction
Add/Edit/Delete item
Add/Edit/Delete User
Add/Edit/Delete Location

Have items properties:
_# Item ID: specific (unique) to each item
_ General item name: the name of this item and all like it # Specific item ID: serial number or identifying string
# Item name: items, such as computers, that have unique device names
_ Item type: PC/printer/mouse/toner cartridge - etc.
User assigned: user attached to individual item
_ Location: missing?/user assigned/location, if community item - etc
_ Department: HR/IT/Sales - etc
Cost: cost of individual item
Lifespan: expected lifespan of item in months
_ Is a consumable/peripheral?: yes/no (checkbox?)

Have User properties:
Name
_# Username
Password
Department
_# ID

Have Location property:
_# Location name

Have general overview properties:
General item name: the name of this item and all like it
Quantity: amount of each item on hand
Cost per: cost of individual item
Total items cost: show how much the cost of all items on hand is
Item type: PC/printer/mouse/toner cartridge - etc.

Locations by default will have [missing, inventory].
Users by default will have [none, unknown].

An item can or cannot be assigned to a location, and a location can or cannot have any items.

An item can be assigned to UP TO 1 user but no more, but users can have 0 or more items assigned to them.

A user MUST HAVE EXACTLY 1 location, but a location can have 0 or more users assigned to it

A user MUST HAVE EXACTLY 1 user account, and a user account must belong to EXACTLY 1 user.

Primary Keys:
    User Account Table: USERNAME
    User Table: ID
    Item Table: ID
    Location Table: NAME

<!--
_-denotes required attribute
#-denotes required uniqueness
-->


To Seed Data:
cat inv_mgmt_project/inv_mgmt/src/seed_data/seed.sql | docker exec -i pg_container psql -U postgres -d inv_mgmt
