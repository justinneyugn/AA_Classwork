Array.prototype.myUniq = function() {
  let newArr = [];
  for (let i = 0; i < this.length; i++) {
    debugger
    if (!newArr.includes(this[i])) {
      newArr.push(this[i]);
    }
  }
  return newArr;
};

// [1,2,2,3,3,3].myUniq()

Array.prototype.twosum = function() {
  let pairsArr = []
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairsArr.push([i, j]);
      }
    }
  }
  return pairsArr;
};
// let array1 = [-1,1,2,-2];

[-1,1,2,-2].twosum();

Array.prototype.transpose = function () {
  newArr = [];
  for (let i = 0; i < this.length; i++) {
    let subArr = [];
    for (let j = 0; j < this.length; j++) {
      subArr.push(this[j][i]);
    }
    newArr.push(subArr);
  }
  return newArr;
}