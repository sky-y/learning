function dummyFetch (path, callback) {
  setTimeout(() => {
    if (path.startsWith('/sucess')) {
      callback(null, { body: `response body of ${path}` })
    } else {
      callback(new Error('NOT FOUND'))
    }
  }, 1000 * Math.random())
}

dummyFetch('/sucess/data', (error, response) => {
  if (error) {
    // 実行されない
  } else {
    console.log(response)
  }
})

dummyFetch('/failure/data', (error, response) => {
  if (error) {
    console.log(error.message)
  } else {
    // 実行されない
  }
})
