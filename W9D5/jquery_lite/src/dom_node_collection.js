class DomNodeCollection {
  constructor(array) {
    this.array = array;
  }

  html(string) {
    if (string) {
      this.array.forEach(ele => {
        ele.innerHTML = string;
      })
      return this;
    } else {
      return this.array[0].innerHTML
    }
  }

  empty() {
    this.html(new String(""));
    return this;
  }

  append(arg) {
    if (arg instanceof HTMLElement) {
      arg = $(arg.outerHTML);
    } else if (typeof(arg) === "string") {
      arg = arg;
    } else {
      arg = arg.outerHTML;
    }

    this.array.forEach(ele => {
      ele.innerHTML += arg;
    });
    return this;
  }

  attr(prop, val) {
    // if (val) {
    //   // user outerhtml to get hte outertag
    //   // how to include in tag
    //   .value = ?

    //   // image.value = url?
    // }

  }

  addClass(...args) {
    this.array.forEach( ele =>{
      ele.classList.add(...args);
    })
    return this;
  }

  removeClass(...args) {
    this.array.forEach(ele => {
      ele.classList.remove(...args);
    })
    return this;
  }
}

module.exports = DomNodeCollection;