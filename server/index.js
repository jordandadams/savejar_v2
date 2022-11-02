// Express
import express from 'express';
// Router
import authRouter from './routes/auth.js'
// Env
import dotenv from 'dotenv'
import connectDB from './db/connect.js'

dotenv.config();

// Use env port or 3000
const PORT = process.env.PORT || 3000
const app = express()

app.use(express.json())
app.use(authRouter)

const start = async () => {
    try {
        // db string
        await connectDB(process.env.MONGO_URL)
        app.listen(PORT, () => {
            console.log(`Connection Successful! On port ${PORT}...`)
        })
    } catch (error) {
        console.log(error)
    }
}

start()