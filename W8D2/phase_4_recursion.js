function range(start, end) { //6,6
  if (start === end) {
    return [];
  }

  arr = range(start + 1, end);//6, 6 []
  console.log(arr);
  arr.push(start + 1);
  return arr;
}

console.log(range(1,6)); //= [1,2,3,4,5,6]

// function range(start, end) {
//   if (start === end) {
//     return [];
//   }

//   let r = range(start + 1, end);
//   r.push(start + 1);
//   return r;
// }

// console.log(range(3, 10));