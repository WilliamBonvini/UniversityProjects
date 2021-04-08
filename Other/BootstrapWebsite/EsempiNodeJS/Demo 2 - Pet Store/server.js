let express = require("express");
let app = express();
let process = require("process");
let bodyParser = require("body-parser");
let _ = require("lodash");

let port = process.env.PORT | 3000;

let petData = require("./petstoredata.json");

app.use(express.static(__dirname + "/public"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

app.set("port", port);

app.get("/pets", function(req, res) {
	res.send(JSON.stringify(petData));
});

app.get("/pets/:example_id", function(req, res) {
	let identifier = parseInt(req.params.example_id);
	let pet = _.find(petData, function (o) {
		return o.id === identifier;
	});
	if(_.isUndefined(pet))
	{
		res.status(400);
		res.send({message: "I didn't found any data :/"});
	}
	else
	{
		res.status(200);
		res.send(pet);
	}
});

app.listen(port, function () {
	console.log("Server started on port " + port);
});