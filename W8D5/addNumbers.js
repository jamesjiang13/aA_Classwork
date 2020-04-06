const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumber(sum, numsLeft, completionCallback) {
  if (numsLeft > 0){
    reader.question(`Please enter ${numsLeft} numbers:`, (res) => { 
      sum += parseInt(res);
      console.log(sum);
      addNumber(sum, numsLeft-1, completionCallback);
    });
  } else {
    if (numsLeft === 0) {
      completionCallback(sum);
      reader.close();
    }
  }
}


// 1, 2, 3
// sum = 6

addNumber(0, 3, sum => console.log(`Total Sum: ${sum}`));