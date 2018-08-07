// Require Node.JS packages
const { join } = require("path");

// Require Third-party packages
const polka = require("polka");
const edge = require("edge.js");
const serv = require("serve-static");
const bodyParser = require("body-parser");

// Execute config
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

// Listen to port!
httpServer.listen(process.port || 3000).then(() => {
    console.log("> Server running on port 3000");
});
