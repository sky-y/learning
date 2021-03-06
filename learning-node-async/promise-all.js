function delay (timeoutMs) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(timeoutMs)
    }, timeoutMs)
  })
}

const promise1 = delay(1)
const promise2 = delay(2)
const promise3 = delay(3)

Promise.all([promise3, promise2, promise1]).then((values) => {
  console.log(values)
})
