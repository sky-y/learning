process.stdin.resume()

process.stdin.on('data', (data) => {
  process.stdout.write(data)
}).on('end', () => {
  process.stdin.destroy()
}).on('close', () => {
  process.exit()
}).on('error', (ex) => {
  process.stdin.destroy()
})

process.stdout.on('close', () => {
  process.exit()
}).on('error', (ex) => {
  process.stdout.destroy()
})
