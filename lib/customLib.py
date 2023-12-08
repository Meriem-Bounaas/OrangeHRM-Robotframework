from faker import Faker
from pathlib import Path
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