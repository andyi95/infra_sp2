import os

from dotenv import load_dotenv

load_dotenv()

print(os.getenv('HOSTS_LIST'))
print(os.getenv('HOSTS_LIST').split(' '))
