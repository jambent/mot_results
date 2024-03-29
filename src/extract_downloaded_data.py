from zipfile import ZipFile
import getpass
import os
import re

username = getpass.getuser()


download_filepath = f'/home/{username}/Downloads/'
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
        break
