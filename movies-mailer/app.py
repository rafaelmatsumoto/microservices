from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
from flask_mail import Mail, Message
from dotenv import load_dotenv
from os import getenv
import requests

load_dotenv()
app = Flask(__name__)
CORS(app)
app.config['MAIL_PORT'] = 1025
mail = Mail(app)

@app.route('/', methods = ['POST'])
def verify():
    email = request.json
    data = requests.get('https://api.blazeverify.com/v1/verify?email=' + email['email'] + '&api_key=' + getenv('BLAZE_KEY'))
    email_data = data.json()
    if email_data['state'] == "deliverable":
        msg = Message("Ingresso",
                  sender="from@example.com",
                  recipients=[email['email']])
        msg.body = "Aqui está seu ingresso"
        msg.html = render_template('/mail.html')
        mail.send(msg)
    return email_data
