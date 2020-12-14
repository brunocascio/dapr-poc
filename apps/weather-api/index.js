const express = require("express");

const app = express();

app.get('/', (_req, res) => res.json({"ok": new Date()}))

app.listen(3000, () => console.log(`Node App listening on port!`));
