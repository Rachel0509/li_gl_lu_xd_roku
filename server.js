const express = require('express');
const path = require('path');
const hbs = require('hbs');
//express router handles incoming requests and directs them where they need to go
//like a traffic cop

const app = express();

//think of route handlers like PHP functions
const port = process.env.PORT || 5000; //environment valuable

app.use(express.static(path.join(__dirname, 'public')))

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');
app.engine('hbs', hbs.__express)

//this catches every route -  every time you change your location bar, this function reacts to it and intercepts the route request
//: export PORT=5000/3838
app.use((req, res, next) => {
  console.log('incoming request');
  console.log(port);

  //next is the original route request ie, /api/users
  next(); //=> send the user to the routes they requseted
})


// app.use("/", (req, res) => res.send("hit the api"));

//use the API route file to handle API routes (/api/users, /api/:user/:id, etc)
app.use("/", require("./routes/index"));
// app.use("/user", require("./routes/user"));
// app.use("/api", require("./routes/api"));
// app.use("/ums", require("./routes/ums"));

//run the app at the PORT
app.listen(port, () => {
  console.log(`server is running on ${port}`);
});