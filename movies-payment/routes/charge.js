const express = require('express');
const router = express.Router();
const stripe = require('stripe')(process.env.STRIPE_KEY)

router.post('/', async (req, res, next) => {
    const {amount, token} = req.body
    try {
        const chargingResponse = await stripe.charges.create({
            amount: amount * 100,
            currency: "usd",
            description: "Movie booking",
            source: token
        })
        res.json(chargingResponse)
    } catch (error) {
        res.json(error)
    }
});

module.exports = router;
