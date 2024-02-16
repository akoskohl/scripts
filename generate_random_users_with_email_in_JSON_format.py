import json
import random
import string
def generate_name():
    first_names = ["John", "Emma", "Michael", "Sophia", "William", "Olivia", "James", "Ava", "Benjamin", "Isabella"]
    last_names = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Garcia", "Rodriguez", "Martinez"]
    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    return f"{first_name} {last_name}"

def generate_username(name):
    return name.lower().replace(" ", "_")

def generate_email(name):
    return f"{name.replace(' ', '').lower()}@doesnotexists.com"

def generate_user_info(user_id):
    name = generate_name()
    username = generate_username(name)
    email = generate_email(name)
    return {
        "id": user_id,
        "name": name,
        "username": username,
        "email": email
    }
