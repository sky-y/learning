const http = require('http')

const httpd = http.createServer()
httpd.listen(8080)

httpd.on('request', (request, response) => {
  response.writeHead(200, { 'Content-Type': 'text/plain' })
  response.write('Hello ')
  response.end('World\n')
})
