from pg8000.native import Connection, DatabaseError
from decouple import config


def get_local_db_connection(database_name):
    """Connect to local PSQL database"""

    try:

        return (Connection(user=config('USERNAME'), 
                            host = config('HOSTNAME'),
                            database=database_name,
                            password=config('PASSWORD')))
    
    except DatabaseError as e:
        print('Error connecting to database')
        raise e
 
    
if __name__ == '__main__':

    try:
        query = f"""SELECT * FROM fact_test_item LIMIT 10;"""
        conn = get_local_db_connection(config('DATABASE'))
        rows = conn.run(query)
        print(rows)

    finally:
        conn.close()
        

