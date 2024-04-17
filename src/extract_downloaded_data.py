import zipfile
from decouple import config
import os
import re
#from pg8000.native import identifier, literal

#from get_local_db_connection import get_local_db_connection


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
        try: 
                    
            #db_conn = get_local_db_connection(config('DATABASE'))
            print(f'Inserting data for {required_year}')
            extract_path = f'/home/{linux_username}/Downloads/extracted_mot_results'
            
            for root,dirs,files in os.walk(download_filepath):
                for file in files:
                
                    
                    if file == f"dft_test_result_{required_year}.zip" or file == f"dft_test_item_{required_year}.zip":
                        
                        zipped_csv_file_path = os.path.join(download_filepath,file)
                        
                        with zipfile.ZipFile(zipped_csv_file_path, mode="r") as archive:
                            archive.extractall(path=extract_path)

            
            #################################################################################
            ##  Use following as basis for programmatic COPY FROM if solution found        ##
            #################################################################################

            # for extracted_root,extracted_dirs,extracted_files in os.walk(extract_path):
            #     for extracted_dir in extracted_dirs:
            #         for extracted_file in os.scandir(extracted_dir):
            #             print(extracted_file)
                        
            #             #extracted_dir_path = os.path.join(extract_path,extracted_dir)
            #             #print(extracted_dir_path)
            #             #extracted_filepath = os.path.join(extracted_dir_path,extracted_file)
            #             extracted_filepath = os.path.join(extract_path,extracted_file)
            #             print(extracted_filepath)
            #             query = f"""COPY fact_test_result FROM {literal(extracted_filepath)} DELIMITER ',' CSV HEADER;"""
            #             db_conn.run(query)
                            
    
        except zipfile.BadZipFile as error:
            print(error)

        # finally:
        #     db_conn.close()
        break
