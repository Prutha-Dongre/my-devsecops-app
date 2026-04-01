const http = require('http');

const server = http.createServer((req, res) => {
    res.end("Application deployed via Jenkins CI/CD with Docker, Trivy security scan & Kubernetes ");
});

server.listen(3000, () => {
    console.log("Server running on port 3000");
});