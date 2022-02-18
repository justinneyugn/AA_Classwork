function sum1() {
    let result = 0;
    for (let i = 0; i < arguments.length; i++) {
        result += arguments[i];
    }
    return result;
}

// console.log(sum1(1, 2, 3, 4));
// console.log(sum1(1, 2, 3, 4, 5));

function sum2(...numbers) {
    let result = 0;
    for (let i = 0; i < numbers.length; i++) {
        result += numbers[i];
    }
    return result;
}

// console.log(sum2(1, 2, 3, 4));
// console.log(sum2(1, 2, 3, 4, 5));


Function.prototype.myBind1 = function(context) {
    const that = this;
    const args = Array.from(arguments).slice(1);
    return function () {
        const copyArgs = Array.from(arguments);
        return that.apply(context, args.concat(copyArgs));
    };
};

Function.prototype.myBind2 = function(context, ...arr) {
    const that = this;
    return function(...copyArgs){
      return that.apply(context, arr.concat(copyArgs));
    }
}

// class Cat {
//     constructor(name) {
//       this.name = name;
//     }
  
//     says(sound, person) {
//       console.log(`${this.name} says ${sound} to ${person}!`);
//       return true;
//     }
//   }
  
  // class Dog {
  //   constructor(name) {
  //     this.name = name;
  //   }
  // }
  
  // const markov = new Cat("Markov");
  // const pavlov = new Dog("Pavlov");
  
  // markov.says("meow", "Ned");
  // // Markov says meow to Ned!
  // // true
  
  // // bind time args are "meow" and "Kush", no call time args
  // markov.says.myBind2(pavlov, "meow", "Kush")();
  // // Pavlov says meow to Kush!
  // // true
  
  // // no bind time args (other than context), call time args are "meow" and "a tree"
  // markov.says.myBind2(pavlov)("meow", "a tree");
  // // Pavlov says meow to a tree!
  // // true
  
  // // bind time arg is "meow", call time arg is "Markov"
  // markov.says.myBind2(pavlov, "meow")("Markov");
  // // Pavlov says meow to Markov!
  // // true
  
  // // no bind time args (other than context), call time args are "meow" and "me"
  // const notMarkovSays = markov.says.myBind2(pavlov);
  // notMarkovSays("meow", "me");
  // // Pavlov says meow to me!
  // // true

function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      let total = 0;
      numbers.forEach((ele) => {total += ele;});
      return total;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry1 = function(numArgs) {
  const arr = [];
  let that = this;
  function _curriedFunction(arg) {
    arr.push(arg);
    console.log(arr);
    if (arr.length >= numArgs) {
      console.log(that);
      return that.apply(null, arr);
    } else {
        console.log(`else statement`);
        return _curriedFunction;
    }
  }
  return _curriedFunction;
}

function sum(arr){
  console.log(arr);
  let total = 0;
  for (let i = 0; i < arr.length; i++) {
    total += arr[i];
  }
  return total;
}

// const curriedVersionOfSum = sum.curry1(4);
// const curriedVersionOfSum2 = curriedVersionOfSum(2);
// const curriedVersionOfSum3 = curriedVersionOfSum2(5);
// const curriedVersionOfSum4 = curriedVersionOfSum3(6);
// const curriedVersionOfSum5 = curriedVersionOfSum4(7);
// console.log(curriedVersionOfSum); // => 56

const testSum = sum.curry1(4);
console.log(testSum(5)(30)(20)(1)); // => 56

Function.prototype.curry2 = function(numArgs) {
  let arr = [];
  let that = this;
  function _curriedFunction(arg) {
    arr.push(arg);
    if (arr.length === numArgs) {
      return that(...arr);
    } else {
        return _curriedFunction;
    }
  }
  return _curriedFunction;
}