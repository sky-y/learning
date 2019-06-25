function dummyFetch (path) {
  return new Promise((resolve, reject) => {
    if (path.startsWith('/success')) {
      resolve({ body: `Response body of ${path}` })
    } else {
      reject(new Error('NOT FOUND'))
    }
  })
}

dummyFetch('/success/data').then((response) => {
  console.log(response)
}, (error) => {
  // not executed
  console.log(error)
})

dummyFetch('/failure/data').then((response) => {
  // not executed
}, (error) => {
  console.log(error)
})
