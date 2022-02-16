Array.prototype.bubblesort = function() {
  let sorted = false;
  while (!sorted) {
    console.log(this);
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        let temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

// console.log([4,3,1,5,6].bubblesort());

String.prototype.substrings = function () {
  arr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      arr.push(this.slice(i, j + 1));
    }
  }
  return arr;
};

// console.log(('stringjs').substrings());