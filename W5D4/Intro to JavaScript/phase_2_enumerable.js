// Phase 2
// Array#myEach
Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i])
  }
}

// Array#myMap
Array.prototype.myMap = function(callback) {
  let arr = []
  this.myEach(function(element) {
    arr.push(callback(element))
    }
  )
  return arr
}

// Array#myReduce
Array.prototype.myReduce = function (callback, initialValue = 0) {
  let acc = initialValue
  this.myEach(function(element){
    acc = callback(acc, element)
  })
  return acc
}
