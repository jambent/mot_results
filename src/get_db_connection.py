from pg8000.native import Connection, DatabaseError
from decouple import config


def get_connection(credentials):
    """Connect to local PSQL database"""
    try:
        DB_HOST = credentials['hostname']
        DB_USER = credentials['username']
        DB_DB = credentials['database']
        DB_PASSWORD = credentials['password']

        return (Connection(user=DB_USER, host=DB_HOST,
                           database=DB_DB, password=DB_PASSWORD))
    except DatabaseError as e:
        print('Error connecting to DB')
        raise e
 
    
if __name__ == '__main__':

    hostname = config('HOSTNAME')
    username = config('USERNAME')
    password = config('PASSWORD')
    
    credentials = {
        'hostname': hostname,
        'username': username,
        'database': 'mot_results',
        'password': password
    }

    try:
        query = f"""SELECT * FROM fact_test_item;"""
        conn = get_connection(credentials)
        rows = conn.run(query)
        print(rows)

    finally:
        conn.close()
        

