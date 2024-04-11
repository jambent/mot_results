import zipfile
from decouple import config
import os
import re
import pandas as pd
from pg8000.native import identifier

from get_local_db_connection import get_local_db_connection


linux_username = config('LINUX_USERNAME')

download_filepath = f'/home/{linux_username}/Downloads/'
downloaded_data_years_available = []

for root,dirs,files in os.walk(download_filepath):
    for file in files: 
        if file.startswith('dft') and file.endswith('.zip'):
            print(file)
            file_year = re.findall(r'\d{4}(?=.zip)', file)[0]
            if f'dft_test_result_{file_year}.zip' and f'dft_test_item_{file_year}.zip':
                if file_year not in downloaded_data_years_available:
                    downloaded_data_years_available.append(file_year)


while True:
    print('Data can be inserted for the following years:')
    for year_available in downloaded_data_years_available:
        print(year_available)
    required_year = input('Please enter year for which you would like MOT data to be inserted (or enter "q" to quit):')
    if required_year == 'q':
        break
    elif required_year in downloaded_data_years_available:
        print(f'Inserting data for {required_year}')
        for root,dirs,files in os.walk(download_filepath):
            for file in files:
                try: 
                    
                    db_conn = get_local_db_connection(config('DATABASE'))
                    
                    if file == f"dft_test_result_{required_year}.zip":
                        
                            zipped_csv_file_path = os.path.join(download_filepath,file)
                            with zipfile.ZipFile(zipped_csv_file_path, mode="r") as archive:
                                for zipped_csv_filename in archive.namelist():
                                    print(zipped_csv_filename)
                                    with archive.open(zipped_csv_filename, mode="r") as csv_file:
                                        df = pd.read_csv(csv_file)
                                        print(df.head())
                                        df=df[df['test_class_id'] == 4]
                                        column_names = [f"{identifier(column)}" for column in df.columns]
                                        column_names_string = f"({', '.join(column_names)})"
                                        column_symbols = [":" + column for column in column_names]
                                        query_start = f"INSERT INTO {identifier('fact_test_result')} {column_names_string} VALUES "
                                        query_end = f'({", ".join(column_symbols)});'
                                        query = query_start + query_end

                                        params_list = []
                                        for i in range(len(df)):
                                            row_values = df.iloc[i, :].values.flatten().tolist()
                                            values_dict = dict(zip(column_names, row_values))
                                            params_list.append(values_dict)
                                        
                                        for params in params_list:
                                            db_conn.run(query, **params)

                    # elif file == f"dft_test_item_{required_year}.zip":
                        
                    #         zipped_csv_file_path = os.path.join(download_filepath,file)
                    #         with zipfile.ZipFile(zipped_csv_file_path, mode="r") as archive:
                    #             for zipped_csv_filename in archive.namelist():
                    #                 print(zipped_csv_filename)
                    #                 with archive.open(zipped_csv_filename, mode="r") as csv_file:
                    #                     df = pd.read_csv(csv_file)
                    #                     print(df.head())
                                        
                    #                     query = f"""SELECT * FROM fact_test_item LIMIT 10;"""
                    #                     rows = db_conn.run(query)
                    #                     print(rows)
    
                except zipfile.BadZipFile as error:
                    print(error)

                finally:
                    db_conn.close()
        break
