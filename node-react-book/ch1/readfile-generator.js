const fs = require('fs')

function readGen (g, fname) {
  fs.readFile(fname, 'utf-8', (err, data) => g.next(data))
}

const g = (function * () {
  const a = yield readGen(g, 'a.txt')
  console.log(a)
  const b = yield readGen(g, 'b.txt')
  console.log(b)
  const c = yield readGen(g, 'c.txt')
  console.log(c)
})()
g.next()
