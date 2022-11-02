import mongoose from 'mongoose'
import validator from 'validator'

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

export default mongoose.model("User", userSchema);