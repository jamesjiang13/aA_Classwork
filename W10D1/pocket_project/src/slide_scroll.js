function debounce(func, wait = 20, immediate = true) {
  let timeout;

  // This is the function that is actually executed when
  // the DOM event is triggered.
  return function executedFunction() {
    // Store the context of this and any
    // parameters passed to executedFunction
    const context = this;
    const args = arguments;

    // The function to be called after debounce time has elapsed
    const later = function () {
      // null timeout to indicate the debounce ended
      timeout = null;

      // Call function now if you did not in the beginning
      if (!immediate) func.apply(context, args);
    };

    // Determine if you should call the function
    // on the leading or trail end
    const callNow = immediate && !timeout;

    // This will reset the waiting every function execution.
    clearTimeout(timeout);

    // Restart the debounce waiting period - returns true
    timeout = setTimeout(later, wait);

    // Call immediately if you're doing a leading end execution
    if (callNow) func.apply(context, args);
  };
}
let imga = document.querySelectorAll('img');
imga.forEach(img=>{
  window.addEventListener('scroll',()=>{
    let top = img.getBoundingClientRect()['top'];
    let height = img.getBoundingClientRect()['height']
    let bottomDistance = (window.pageYOffset + window.innerHeight)
    console.log(`top=${top}`)
    console.log(`height=${height}`)
    console.log(`bottom=${bottomDistance}`)
    if (top+(height/2) < bottomDistance) {
      img.classList.add('active')
      }
  })
})