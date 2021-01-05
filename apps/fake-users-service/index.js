const express = require("express");
const faker = require("faker");

const PORT = process.env.PORT || 3000;

const app = express();

app.get('/users', (_req, res) => {
    console.log('get users')
    const data = [...Array(10).keys()].map(() => faker.helpers.userCard());
    return res.json({
        data
    })
})

app.listen(PORT, () => console.log(`🚀 users api listening on :${PORT} port`));
