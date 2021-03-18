#! /usr/bin/python3.6

import logging
import sys
import random
import string
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0, '/srv/')
from app import app as application
secret = ''
for i in range(2048):
    secret+=random.choice(string.ascii_letters+string.digits+string.punctuation)
application.secret_key = secret