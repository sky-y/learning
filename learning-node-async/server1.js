const http = require('http')

http.createServer((request, response) => {
  response.writeHead(200, { 'Content-Type': 'text/plain' })
  response.write('Hello ')
  response.end('World\n')
}).listen(8080)
