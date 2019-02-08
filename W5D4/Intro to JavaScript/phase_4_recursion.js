// Phase 4
// Range function
const range = function (start, end) {
  if (start === end) {
    return [start];
  }

  let arr = [];
  arr.push(start);
  arr = arr.concat(range(start + 1, end));
  return arr;
}

// SumRec function
const sumRec = function(array) {
  if (array.length < 2) {
    return array[0];
  }

  let sum = array[0] + sumRec(array.slice(1));
  return sum
}

// Exponential function
const expon = function(base, exp) {
  if (exp === 1) {
    return base;
  }
  if (exp === 0) {
    return 1;
  }

  return base * expon(base, exp - 1);
}

// Fibonacci function
const fib = function(n) {
  let arr = []
  for (let i = 0; i <= n-1; i++) {
    arr[i] = helper_fib(i)
  }
  return arr
}

const helper_fib = function(n) {
  if (n === 0) {
    return 1
  }
  if (n === 1) {
    return 1
  }
  return helper_fib(n-1) + helper_fib(n-2)
}

// Deep Dup function
const deepDup = function(arr) {
  if (arr.length < 2) {
    return arr
  }

  let dupArr = []
  dupArr.push(arr[0])
  dupArr = dupArr.concat(deepDup(arr.slice(1)))
  return dupArr
}

// B Search function
const bsearch = function(arr, target) {
  if (arr.length < 1) {
    return -1;
  }

  let mid_idx = (arr.length/2);
  if (arr[mid_idx] === target) {
    return mid_idx;
  } else if (arr[mid_idx] > target) {
    return bsearch(arr.slice(0, mid_idx), target)
  } else if (arr[mid_idx] < target) {
    return bsearch(arr.slice(mid_idx + 1), target) + mid_idx
  }
}
