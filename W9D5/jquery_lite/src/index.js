const DomNodeCollection = require('./dom_node_collection');

// console.log("hello")

const $l = function(selector) {
  // console.log(typeof(selector));
  // console.log(selector instanceof string);

  if (typeof(selector) === "string") {
    const nodeList = document.querySelectorAll(selector);
    const nodeArray = Array.from(nodeList);
    return new DomNodeCollection(nodeArray);
  } else if (selector instanceof HTMLElement) {

    const HTMLElementArray = Array.from(selector);
    return new DomNodeCollection(HTMLElementArray);
  } 
};

window.$l = $l;

