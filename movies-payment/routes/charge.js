const express = require('express');
const router = express.Router();
const stripe = require('stripe')(process.env.STRIPE_KEY)
const axios = require('axios')

router.post('/', async (req, res, next) => {
    const {email, amount, token, movie} = req.body
    try {
        const chargingResponse = await stripe.charges.create({
            amount: amount * 100,
            currency: "usd",
            description: "Movie booking",
            source: token
        })
        res.json(chargingResponse)
        axios({
            method: 'post',
            url: 'http://localhost:3000/orders',
            data: {
                user_email: email,
                price: amount,
                movie_id: movie
            }
        })
    } catch (error) {
        res.json(error)
    }
});

module.exports = router;
