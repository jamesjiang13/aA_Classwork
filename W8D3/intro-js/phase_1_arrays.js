Array.prototype.uniq = function() {
  let unique = [];
  this.forEach(function(el) {
    if (!unique.includes(el)) {
      unique.push(el);
    }
  });
  return unique;
};

// let arr = [1,2,2,4]
// arr.uniq();

Array.prototype.twoSum = function() {
  let pairs = [];
  for(let i = 0; i < this.length; i++){
    for(let j = i+1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([i,j]);
      }
    }
  }
  return pairs;
};

// let arr = [1, 0, 2, -2, -1];
// arr.twoSum();

Array.prototype.transpose = function() {
  let newArr = [];
  
  for( let row = 0; row < this.length; row ++) {
    temp = [];
    for(let col = 0; col < this[row].length; col ++) {
      temp.push(this[col][row]);  
    }
    newArr.push(temp);
  }
  return newArr;
};

// let newArray = [
//                 [1,2],
//                 [3,4]
//               ];

// newArray.transpose();  

