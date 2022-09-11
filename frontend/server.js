import express from "express";


var app = express();
app.use(express.static('public')); //__dir and not _dir
var port = 5050; // you can use any port
app.listen(port);
console.log('server on ' + port);