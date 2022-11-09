import express from 'express'
const authRouter = express.Router();
import bcryptjs from 'bcryptjs'
import User from '../models/user.js'
import jwt from 'jsonwebtoken'

// Sign Up
authRouter.post("/api/signUp", async (req, res) => {
    console.log("in the sign up")
    try {
        // Sign Up Requirements
        const { name, email, password } = req.body;
        // Determines if email already exists
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            // 400 is bad request
            return res.status(400).json({ msg: "User with the same email already exists!" });
        }
        // Hash password
        const hashPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            email,
            password: hashPassword,
            name,
        });
        user = await user.save();
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ user: user, token: token });
    } catch (e) {
        // Error
        res.status(500).json({ error: e.message });
    }
});

// Sign In
authRouter.post("/api/login", async (req, res) => {
    console.log("in the sign in")
    try {
        // Email and Password
        const { email, password } = req.body;
        // Checks if email exists
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: "User with this email does not exist!" });
        }
        // Checks passwords
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect password!" });
        }
        // JWT
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

export default authRouter