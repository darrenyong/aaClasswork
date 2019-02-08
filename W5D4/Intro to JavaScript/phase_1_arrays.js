// Phase 1
// Array#uniq
Array.prototype.uniq = function() {
  let arr = []
  // iterate through this(self)
  // push ele into arr if arr !include ele
  // skip if arr include ele
  for (let i = 0; i < this.length; i++) {
    if (!arr.includes(this[i])) arr.push(this[i])
  }
  return arr
}

// Array#twoSum
Array.prototype.twoSum = function() {
  let pos = []
  for (let i = 0; i < this.length; i++) {
   for (let j = i + 1; j < this.length; j++) {
     if (this[i] + this[j] === 0) pos.push([i, j])
   }
  }
  return pos
}

// Array#transpose
Array.prototype.transpose = function() {
  let arr = new Array(this[0].length)
  for (let i = 0; i < arr.length; i++) {
    arr[i] = new Array(this.length)
  }
  for (let i = 0; i < this[0].length; i++) {
    for (let j = 0; j < this.length; j++) {
      arr[i][j] = this[j][i]
      // arr[1][2] = this[2][1]
    }
  }
  return arr
}
