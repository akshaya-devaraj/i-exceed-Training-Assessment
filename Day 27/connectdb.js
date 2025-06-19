const mongoose = require('mongoose');

const connectDB = async(mongoUri) => {
 await mongoose.connect(mongoUri)
 //.then((res) => console.log(res))
 .then(() => console.log(`Mongodb successfully connected!`))
 .catch((error) => console.log(error.message));
}

module.exports = connectDB