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

app.post('/orders', async (_req, res) => {
  try {
    const response = await axios.get(`http://localhost:3500/v1.0/invoke/products-service/method/products`);
    console.log(response);
    return res.send("YES!");
  } catch (error) {
    console.log(error)
    return res.status(500).json({ error })
  }
})

app.listen(PORT, () => console.log(`🚀 orders api listening on :${PORT} port`));
