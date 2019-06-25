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

const fetchedPromise = Promise.all([
  dummyFetch('/resource/A'),
  dummyFetch('/dummy_resource/B')
])

fetchedPromise.then(([responseA, responseB]) => {
  console.log(responseA.body)
  console.log(responseB.body)
})
