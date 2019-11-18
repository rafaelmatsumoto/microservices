var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const cors = require('cors')
var logger = require('morgan');
require('dotenv').config();
const paymentRouter = require('./routes/charge');

var app = express();

app.use(logger('dev'));
app.use(cors())
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(bodyParser.json())
app.use(express.static(path.join(__dirname, 'public')));

app.use('/charge', paymentRouter);

module.exports = app;
