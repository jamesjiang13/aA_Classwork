Array.prototype.myEach = function(callback) {
  for(let i = 0; i < this.length; i++) {
  //this.forEach(function(el) {
    callback(this[i]);
  //});
  }
};

// let arr2 = ["Han", "Leia", "Ben Vader"];
// 
let arr3 = [1,2,3,4,5];

Array.prototype.myMap = function(callback) {
 let newArr = [];
  this.myEach(function(el) {
    newArr.push(callback(el));
  });
  return newArr;
};
arr3.myMap(function(el) {
  return (el + 1); 
});

Array.prototype.myReduce = function(callback, el) {
  let initial;
  if (el) {
    initial = el;
  } else {
    initial = this[0];
  }

  let arr = this.slice(1, this.length);

  arr.myEach(fucnction(callback) {
    initial = callback()
  }

}


// without initialValue
[1, 2, 3].myReduce(function(acc, el) {
  return acc + el;
}); // => 6

// with initialValue
[1, 2, 3].myReduce(function(acc, el) {
  return acc + el;
}, 25); // => 31