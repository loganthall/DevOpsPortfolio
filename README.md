# Basic Inventory Management System

 This project is for setting up an very basic inventory and user management system, and the API calls to each of the endpoints that would give information regarding those.

 ### How To Set Up The Environment Currently

 1. Download and unzip the contents of `inv_mgmt_db.zip==`
 2. Create a database in your Postgres container named `inv_mgmt`
 3. Using bash, and inside of the `inv_mgmt_db` folder, create a virtual environment with the command `python -m venv inv_venv`
 4. Activate the virtual environment by running the command `./inv_venv/scripts/activate`
 5. Make sure all of the proper modules are installed in the virtual environment by running `python -m pip install -r requirements.txt`
 6. Navigate to inv_mgmt by running `cd flask/inv_mgmt`
 7. Open the `/src/__init__.py` file and modify the `SQLALCHEMY_DATABSE_URI` on line 12 to point to your own local PostgreSQL database.
 8. Run the code `flask db upgrade`
 9. Run the data seeding process by running the code `cat /src/seed_data/seed.sql | docker exec -i pg_container psql -U postgres -d inv_mgmt`, replacing the user 'postgres' if your user account is different.
 10. Type and run the code `flask run` to begin the virtual environment and begin testing.
<br>
<br>

## API Endpoints
 All enpoints user a base_url of `http://localhost:5000`

| HTTP Verb |      Endpoint                |      Description                                                                             |
|:---------:|:-----------------------------|:---------------------------------------------------------------------------------------------|
|POST       |/user_accounts                | Creates a user account. Requires `username`, `password`.                                     |
|POST       |/users                        | Creates a user. Requires 'name', `department`, `username`.                                   |
|POST       |/locations                    | Creates a location. Requires `name`.                                                         |
|POST       |/items                        | Creates an item. Requires `general_name`.                                                    |
|POST       |/users_locations              | Creates a user link to a location. Requires `users_id`, `locations_name`.                    |
|GET        |/user_accounts                | Retrieves all records with all information from User Accounts.                               |
|GET        |/users                        | Retrieves all records with all information from Users.                                       |
|GET        |/locations                    | Retrieves all records with all information from Locations.                                   |
|GET        |/items                        | Retrieves all records with all information from Items.                                       |
|GET        |/users_locations              | Retrieves all records with all information from User Locations.                              |
|GET        |/user_accounts/`str:username` | Retrieve all User Account information at the specified username.                             |
|GET        |/users/`int:id`               | Retrieve all User information at the specified record ID.                                    |
|GET        |/items/`int:id`               | Retrieve all Item information at the specified record ID.                                    |
|GET        |/users_locations/`int:id`     | Retrieve all User Location information at the specified record ID.                           |
|PUT        |/user_accounts/`str:username` | Update User Account information related to given username. Can update `username`,`password`. |
|PUT        |/users/`int:id`               | Update User information related to given user id. Can update `name`,`department`,`username`. |
|PUT        |/locations/`str:name`         | Update Location information related to given name. Can update `name`.                        |
|PUT        |/items/`int:id`               | Update Item information related to a given item id. Can update `item_name`,`cost`,           |
|           |                              | `lifespan`,`general_name`,`consumable_peripheral`, `assigned_user`.                          |
|DEL        |/user_accounts/`str:username` | Delete User Account associated with given username.                                          |
|DEL        |/users/`int:id`               | Delete User associated with given user id.                                                   |
|DEL        |/locations/`str:name`         | Delete Location associated with given location name.                                         |
|DEL        |/items/`int:id`               | Delete item associated with given item id.                                                   |
|DEL        |/users_locations/user/`int:id`| Delete all records relating to the given user from the User Locations table.                 |
|DEL        |/users_locations/`int:id`     | Delete a single record from the User Locations table by the given id.                        |
