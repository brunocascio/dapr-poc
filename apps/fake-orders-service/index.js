const express = require("express");
const faker = require("faker");
const axios = require("axios");

const PORT = process.env.PORT || 3000;

const app = express();

app.get('/orders', (_req, res) => {
    const data = ['TODO']
    return res.json({
        data
    })
})

app.post('/orders', async (req, res) => {
    try {
        const data = await axios.get('http://localhost:3500/v1.0/invoke/users-service/method/users').catch(console.log);
        return res.json({
            data: data
        })
    } catch (error) {
        return res.status(500).json({
            error
        })
    }
})

app.listen(PORT, () => console.log(`🚀 orders api listening on :${PORT} port`));
