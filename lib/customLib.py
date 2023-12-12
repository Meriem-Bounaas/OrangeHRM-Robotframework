from faker import Faker
from pathlib import Path
import pandas as pd
import string
import random
import csv
import os


fake = Faker()
    
def generate_first_name():
    '''Function to generate a first name'''
    return fake.name().split(' ')[0]

def generate_last_name():
    '''Function to generate a last name'''
    return fake.name().split(' ')[1]

def generate_id():
    '''Function to generate an id'''
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for _ in range(2))

def generate_password():
    '''Function to generate a password'''
    return fake.password()

def generate_email():
    '''Function to generate an email'''
    return fake.email()

def generate_city():
    '''Function to generate a city name'''
    return fake.city()

def generate_zip():
    '''Function to generate a ZIP code'''
    return fake.postcode()

def save_data_csv(file_name, header, data_row):
    '''Function to save data in csv file'''
    path = Path(__file__).parent.parent

    filename = os.path.join(
        path, f'tests/assets/{file_name}')
    file_exists = os.path.isfile(filename)

    with open(filename, 'a', encoding="UTF8", newline='') as file:
        writer = csv.writer(file)
        if not file_exists:
            writer.writerow(header)
        writer.writerow(data_row)

def get_employee_login_data_from_csv_file():
    '''Function to retrieve employee login data from a CSV file.'''
    path = Path(__file__).parent.parent
    filename = os.path.join(
        path, 'tests/assets/data_login_employees_valid.csv')
    
    with open(filename, encoding="UTF8", newline='') as f:
        heading = next(f)
        reader = csv.reader(f)
        return random.choice(list(reader))
    
def get_valid_admin_login_data_from_csv_file():
    '''Function to retrieve admin login data from a CSV file'''
    path = Path(__file__).parent.parent
    filename = os.path.join(
        path, 'tests/assets/data_login_admin_valid.csv')
    with open(filename, encoding="UTF8", newline='') as f:
        heading = next(f)
        reader = csv.reader(f)
        return next(reader)
    
def get_invalid_admin_login_data_from_csv_file():
    '''Function to retrieve employee login data from a CSV file.'''
    path = Path(__file__).parent.parent
    filename = os.path.join(
        path, 'tests/assets/data_login_admin_invalid.csv')
    
    with open(filename, encoding="UTF8", newline='') as f:
        heading = next(f)
        reader = csv.reader(f)
        return random.choice(list(reader))
    
def search_employee():
    '''Function to search an employee using ID'''
    path = Path(__file__).parent.parent
    filename = os.path.join(
        path, 'tests/assets/data_employees_informations.csv')
    
    with open(filename, encoding="UTF8", newline='') as f:
        heading = next(f)
        reader = csv.reader(f)
        return random.choice(list(reader))
    
def split_employee_informations_table(employees_table):
        '''Function to split employee information table'''
        print(employees_table)
        id_employee = employees_table[0].text.splitlines()[0]
        first_name = employees_table[0].text.splitlines()[1]
        last_name = employees_table[0].text.splitlines()[2]

        return  [id_employee, first_name, last_name]

def update_id_employee_in_csv_file(old_id, new_id):
    '''Function to update employee id in csv file'''
    path = Path(__file__).parent.parent
    filename = os.path.join(
        path, 'tests/assets/data_employees_informations.csv')

    employee_informations_row = []
    data = pd.read_csv(filename)

    for i, row in enumerate(data.itertuples()):
        id_employee = row.id_employee
        first_name = row.first_name
        last_name = row.last_name
        username = row.username_employee
        password = row.password_employee

        if id_employee == old_id:
            employee_informations_row.append(row)

            df = data.drop(data.index[i])
            df.to_csv(filename, index=False)
            break
    
    employee_informations_row[0] = new_id
    employee_informations_row.append(first_name)
    employee_informations_row.append(last_name)
    employee_informations_row.append(username)
    employee_informations_row.append(password)

    with open(filename, 'a', encoding="UTF8", newline='') as file:
        writer = csv.writer(file)
        writer.writerow(employee_informations_row)