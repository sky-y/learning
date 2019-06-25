const fs = require('fs')

function readFilePr (fname) {
  return new Promise((resolve) => {
    fs.readFile(fname, 'utf-8', (err, s) => resolve(s))
  })
}

readFilePr('a.txt')
  .then((text) => {
    console.log('a.txtを読み込みました', text)
    return readFilePr('b.txt')
  })
  .then((text) => {
    console.log('b.txtを読みました', text)
    return readFilePr('c.txt')
  })
  .then((text) => {
    console.log('c.txtを読みました', text)
  })
