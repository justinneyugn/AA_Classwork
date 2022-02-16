Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
};

// function powerOfTwo(num) {
//     return num * num;
// }

Array.prototype.myMap = function(cb) {
    let newArr = [];
    this.myEach(ele => newArr.push(cb(ele)));
    return newArr;
};

// console.log([1,2,3,4].myMap( num => num * num ));

Array.prototype.myReduce = function(cb, initialValue) {
    let arr = this;
    if (initialValue === undefined) {
        initialValue = arr[0];
        arr = arr.slice(1);
    }
    let result = initialValue;
    arr.myEach(el => result = cb(result, el));
    return result;
};

console.log([1,2,3,4].myReduce( (total, item) => total + item ));