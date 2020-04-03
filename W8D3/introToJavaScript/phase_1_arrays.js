function wordReturn(){
  let arr = [];
  return function(word) {
    debugger;
    arr.push(word)
    console.log(word)
  }
}

wordReturn('frank');