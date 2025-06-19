require('dotenv').config();
const express = require('express');
const app = express();
const connectDB = require('./db/connectDB');
const PORT = process.env.PORT || 3000;

connectDB(process.env.MONGO_URI)

app.post('/api/user' , async(req,res) => {
  const {username,email} = req.body;

  await User.create({
    username,
    email
  })

  res.status(200).json(req.body);


})

app.get('/', (req, res) => {
res.send("Hello, there!");
})

//console.log(process.env.MONGO_URI)
connectDB(process.env.MONGO_URI)

app.listen(PORT, () => {
console.log(`Server is running on port ${PORT}...`);
})