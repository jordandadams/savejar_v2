const mongoose = require("mongoose");
const validator = require("validator");

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: validator.isEmail,
            message: 'Please provide a valid email!',
        },
    },
    password: {
        required: true,
        type: String,
    },
});

const User = mongoose.model("User", userSchema);
module.exports = User;