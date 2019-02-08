// Phase 3
// Array#bubbleSort
Array.prototype.bubbleSort = function() {
  for (let i = 0; i < this.length; i++) {
    for (let j = this.length - 1; j > 0; j--) {
      if (this[j] < this[j-1]) {
        var temp = this[j];
        this[j] = this[j-1];
        this[j-1] = temp;
      }
    }
  }
  return this
}

// Array#substrings
String.prototype.substrings = function() {
  let sub_arr = []
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      sub_arr.push(this.slice(i, j+1))
    }
  }
  return sub_arr
}
