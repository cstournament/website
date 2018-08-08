// Require Node.JS packages
const { join } = require("path");

// Require Third-party packages
const polka = require("polka");
const edge = require("edge.js");
const serv = require("serve-static");
const bodyParser = require("body-parser");
const mysql = require("mysql2");

// Require Config
const config = require("./config.json");

// Connect MariaDB
const connection = mysql.createConnection(config.database);
connection.on("error", console.error);

// Execute config
edge.configure({
    cache: false
});
edge.registerViews(join(__dirname, "view"));

// Create http server
const httpServer = polka();

// Serve static assets into root /public directory!
httpServer.use(serv(join(__dirname, "public")));

// Parse HTTP form JSON body
httpServer.use(bodyParser.json());

// Get home route
httpServer.get("/", (req, res) => {
    res.end(edge.render("home"));
});

httpServer.get("/login", (req, res) => {
    res.end(edge.render("login"));
});

httpServer.get("/signin", (req, res) => {
    res.end(edge.render("signin"));
});

// Create a new account!
httpServer.post("/signin", (req, res) => {
    if (!req.body) {
        return res.sendStatus(400);
    }


    return res.end("ok");
});

// Listen to port!
httpServer.listen(process.port || 3000).then(() => {
    console.log("> Server running on port 3000");
});
