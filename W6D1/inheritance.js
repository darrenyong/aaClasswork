Function.prototype.inherits = function (parent) {
  let that = this;
  function Surrogate () {
  }
  Surrogate.prototype = parent.prototype;
  that.prototype = new Surrogate();
  that.prototype.constructor = that;
}

function MovingObject () {}

MovingObject.prototype.move  = function() {
  console.log("zoom");
};

function Ship () {}
Ship.inherits(MovingObject);


// Using object.create
Function.prototype.inherits = function (parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
 
}

function MovingObject () {}

MovingObject.prototype.move  = function() {
  console.log("zoom");
};

function Ship () {}
Ship.inherits(MovingObject);
