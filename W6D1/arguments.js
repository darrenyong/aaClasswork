// Sum with arguments keyword
function sum() {
  let arr = Array.from(arguments);
  let total = 0;
  for (let i = 0; i < arr.length; i++) {
    total += arr[i];
  }
  return total;
}

// Sum with rest operator
function sum(...args) {
  let total = 0;
  for (let i = 0; i < args.length; i++) {
    total += args[i];
  }
  return total;
}

// Bind
Function.prototype.myBind = function() {
  let bindTimeArg = Array.from(arguments);
  let ctx = bindTimeArg[0];
  let fn = this;
  return function() {
    let callTimeArg = Array.from(arguments);
    let combinedArg = bindTimeArg.slice(1).concat(callTimeArg);
    return fn.apply(ctx, combinedArg);
  };
}


// Bind with rest operator
Function.prototype.myBind = function(...args) {
  let bindTimeArg = args.slice(1);
  let ctx = args[0];
  // let fn = this;
  return (...args) => {
    // let callTimeArg = args;
    let combinedArg = bindTimeArg.concat(args);
    return this.apply(ctx, combinedArg);
  };
}


// Curried Sum
function curriedSum (numArgs) {
  let numbers = [];
  return function _curriedSum(...num) {
    for (let i = 0; i < num.length; i++) {
      numbers.push(num[i]);
    }

    if (numbers.length === numArgs) {
      return numbers.reduce(function(acc, el) {
        return acc + el;
      },0);
    } else {
      return _curriedSum;
    }
  }
}


// Prototype Curry 
// With using spread operator
Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let that = this;
  return function _curry(...num) {
    for (let i = 0; i < num.length; i++) {
      numbers.push(num[i]);
    }

    if (numbers.length === numArgs) {
      return that(...numbers);
    } else {
      return _curry;
    }
  }
}


// With Apply 
Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let that = this;
  return function _curry(...num) {
    for (let i = 0; i < num.length; i++) {
      numbers.push(num[i]);
    }

    if (numbers.length === numArgs) {
      return that.apply(that,numbers);
    } else {
      return _curry;
    }
  }
}


