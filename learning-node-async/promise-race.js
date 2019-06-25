function timeout (timeoutMs) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      reject(new Error(`Timeout: ${timeoutMs}ミリ秒経過`))
    }, timeoutMs)
  })
}

function dummyFetch (path) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (path.startsWith('/resource')) {
        resolve({ body: `Response body of ${path}` })
      } else {
        reject(new Error('NOT FOUND'))
      }
    }, 1000 * Math.random())
  })
}

Promise.race([
  dummyFetch('/resource/data'),
  timeout(500)
]).then(response => {
  console.log(response.body)
}).catch(error => {
  console.log(error.message)
})
