// Express
const express = require("express");
// Mongoose
const mongoose = require("mongoose");
// Router
const authRouter = require("./routes/auth");

// Use env port or 3000
const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(authRouter);

const DB = "mongodb+srv://jordan:ADR-0104ad@nodeexpressprojects.qwdklnl.mongodb.net/?retryWrites=true&w=majority"

mongoose.connect(DB).then(() => {
    console.log("Connection Successful!");
}).catch((e) => {
    console.log(e);
});

// allows access from anywhere and logs port
app.listen(PORT, "0.0.0.0", () => {
    console.log(`connect at port ${PORT}`);
});