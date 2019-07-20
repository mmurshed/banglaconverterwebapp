const http = require('http');
const url = require('url');
const converter = require('./converter')

const server = http.createServer((request, response) => {
    var url_parts = url.parse(request.url, true);
    var query = url_parts.query;

    let bangla = query.bangla + ""; // convert to string
    let format = query.format || "bijoy";
 
    let result = converter.ConvertToUnicode(format, bangla);
    response.writeHead(200, {"Content-Type": "text/plain; charset=utf-8"});
    response.end(result);
});

const port = process.env.PORT || 1337;
server.listen(port);

console.log("Server running at http://localhost:%d", port);
