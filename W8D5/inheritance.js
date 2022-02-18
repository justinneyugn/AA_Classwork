Function.prototype.inherits1 = function(parentClass) {
    function Surrogate () {}
    Surrogate.prototype = parentClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

Function.prototype.inherits2 = function(parentClass) {
    this.prototype = Object.create(parentClass.prototype);
    this.prototype.constructor = this;
}

// function MovingObject (name) {
//     this.name = name
// }

// MovingObject.prototype.sayHi = function () {
//     console.log("Say Hi")
// }


// function Ship () {}
// Ship.inherits2(MovingObject);

// Ship.prototype.hi = function () {
//     console.log("hi")
// }

// const ship = new Ship("Train")


// function Asteroid () {}
// Asteroid.inherits2(MovingObject);