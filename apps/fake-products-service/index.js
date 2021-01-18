const express = require("express");
const faker = require("faker");

const PORT = process.env.PORT || 3000;

const app = express();

app.get('/products', (_req, res) => {
    console.log('Hit products!')
    const data = [...Array(10).keys()].map(() => ({
        color: faker.commerce.color(),
        department: faker.commerce.department(),
        name: faker.commerce.product(),
        price: faker.commerce.price(),
        adjetive: faker.commerce.productAdjective(),
        material: faker.commerce.productMaterial(),
        description: faker.commerce.productDescription(),
    }));
    return res.json({
        data
    })
})

app.listen(PORT, () => console.log(`🚀 products api listening on :${PORT} port`));
