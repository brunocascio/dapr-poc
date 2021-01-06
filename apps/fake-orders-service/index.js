const express = require("express");
const axios = require("axios");

const PORT = process.env.PORT || 3000;

const app = express();

app.get('/orders', (_req, res) => {
    const data = ['TODO']
    return res.json({
        data
    })
})

app.post('/orders', (_req, res) => {
    axios
        .get(
        `http://localhost:3500/v1.0/invoke/products-service/method/products`
        )
        .then((response) => res.json(response))
        .catch((err) => {
            console.log(err)
            res.status(500).json({error: err.message})
        });
})

app.listen(PORT, () => console.log(`🚀 orders api listening on :${PORT} port`));
