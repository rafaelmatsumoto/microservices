from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
from flask_mail import Mail, Message
from dotenv import load_dotenv
from os import getenv
import requests
import logging

load_dotenv()
app = Flask(__name__)
CORS(app)
app.config['MAIL_PORT'] = 1025
mail = Mail(app)

@app.route('/', methods = ['POST'])
def verify():
    email = request.json
    verified_email = requests.get('https://api.blazeverify.com/v1/verify?email=' + email['email'] + '&api_key=' + getenv('BLAZE_KEY'))
    email_data = verified_email.json()
    if email_data['state'] == "deliverable":
        send_email(email)
    return email_data

def send_email(email):
    msg = Message("Ingresso",
              sender="from@example.com",
              recipients=[email['email']])
    msg.body = "Aqui está seu ingresso metodo extraido"
    msg.html = render_template('/mail.html')
    mail.send(msg)
