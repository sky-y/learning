function asyncTask () {
  if (Math.random() > 0.5) {
    return Promise.resolve('成功')
  } else {
    return Promise.reject(new Error('失敗'))
  }
}

asyncTask()
  .then((value) => {
    console.log(value)
  })
  .catch((error) => {
    console.log(error.message)
  })
