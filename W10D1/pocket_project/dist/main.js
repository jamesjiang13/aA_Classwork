/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n// const htmlGenerator = require(\"./warmup.js\")\n\n// import * as htmlGenerator from \"./warmup\";\n// const hG = htmlGenerator.htmlGenerator;\n\nclass Clock {\n    constructor() {\n      // 1. Create a Date object.\n      const currentTime = new Date();\n\n      // 2. Store the hour, minute, and second.\n      this.hours = currentTime.getHours();\n      this.minutes = currentTime.getMinutes();\n      this.seconds = currentTime.getSeconds();\n\n      // 3. Call printTime.\n      this.printTime();\n\n      // 4. Schedule the tick at 1 second intervals.\n      setInterval(this.t_tick.bind(this), 1000);\n    }\n\n    printTime() {\n      // Format the time in HH:MM:SS\n      const timeString = [this.hours, this.minutes, this.seconds].join(\":\");\n\n      // Use console.log to print it.\n    //   console.log(timeString);\n      \n      const clock = document.getElementById(\"clock\");\n      Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(timeString,clock); \n    }\n\n    _tick() {\n      // 1. Increment the time by one second.\n      this._incrementSeconds();\n\n      // 2. Call printTime.\n      this.printTime();\n    }\n\n    _incrementSeconds() {\n      // 1. Increment the time by one second.\n      this.seconds += 1;\n      if (this.seconds === 60) {\n          this.seconds = 0;\n          this._incrementMinutes();\n      }\n    }\n\n    _incrementMinutes() {\n      this.minutes += 1;\n      if (this.minutes === 60) {\n          this.minutes = 0;\n          this._incrementHours();\n      }\n    }\n\n    _incrementHours() {\n      this.hours = (this.hours + 1) % 24;\n    }\n};\n\n// module.exports = Clock;\n/* harmony default export */ __webpack_exports__[\"default\"] = (Clock);\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! exports provided: dogLinkCreator, attachDogLinks, handleEnter, handleLeave */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"dogLinkCreator\", function() { return dogLinkCreator; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"attachDogLinks\", function() { return attachDogLinks; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"handleEnter\", function() { return handleEnter; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"handleLeave\", function() { return handleLeave; });\n\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nconst dogLinkCreator = function(){\n  let dogArray = []\n  Object.keys(dogs).forEach(dog => {\n    let a = document.createElement('a');\n    a.innerHTML = dog;\n    a.setAttribute('href',dogs[dog]);\n    let li = document.createElement('li');\n    li.classList.add('dog-link');\n    li.appendChild(a);\n    dogArray.push(li);\n  });\n  return dogArray;\n};\n\nconst attachDogLinks = function(){\n  let dogLinks = dogLinkCreator();\n  let ul = document.getElementsByClassName(\"drop-down-dog-list\")[0];\n  \n  dogLinks.forEach( el => {\n    ul.appendChild(el);\n  })\n}\n\nconst handleEnter = function() {\n  \n  let links = document.getElementsByClassName(\"dog-link\");\n  let arr = Array.from(links);\n  arr.forEach( link => {\n    link.classList.add(\"hovered\");\n  })\n}\n\nconst handleLeave = function() {\n \n  let links = document.getElementsByClassName(\"dog-link\");\n  let arr = Array.from(links);\n  arr.forEach( link => {\n    link.classList.remove(\"hovered\");\n  })\n}\n\nlet nav = document.getElementsByClassName(\"drop-down-dog-nav\")[0];\n\nnav.addEventListener(\"mouseenter\", handleEnter);\nnav.addEventListener(\"mouseleave\", handleLeave);\n\nattachDogLinks();\n\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock.js */ \"./src/clock.js\");\n/* harmony import */ var _drop_down_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down.js */ \"./src/drop_down.js\");\n/* harmony import */ var _todo_list_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list.js */ \"./src/todo_list.js\");\n/* harmony import */ var _slide_scroll_js__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./slide_scroll.js */ \"./src/slide_scroll.js\");\n/* harmony import */ var _slide_scroll_js__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(_slide_scroll_js__WEBPACK_IMPORTED_MODULE_4__);\n\n\n\n\n\n\nconst clck = new _clock_js__WEBPACK_IMPORTED_MODULE_1__[\"default\"];\nwindow.clck = clck;\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/slide_scroll.js":
/*!*****************************!*\
  !*** ./src/slide_scroll.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function debounce(func, wait = 20, immediate = true) {\n  let timeout;\n\n  // This is the function that is actually executed when\n  // the DOM event is triggered.\n  return function executedFunction() {\n    // Store the context of this and any\n    // parameters passed to executedFunction\n    const context = this;\n    const args = arguments;\n\n    // The function to be called after debounce time has elapsed\n    const later = function () {\n      // null timeout to indicate the debounce ended\n      timeout = null;\n\n      // Call function now if you did not in the beginning\n      if (!immediate) func.apply(context, args);\n    };\n\n    // Determine if you should call the function\n    // on the leading or trail end\n    const callNow = immediate && !timeout;\n\n    // This will reset the waiting every function execution.\n    clearTimeout(timeout);\n\n    // Restart the debounce waiting period - returns true\n    timeout = setTimeout(later, wait);\n\n    // Call immediately if you're doing a leading end execution\n    if (callNow) func.apply(context, args);\n  };\n}\nlet imga = document.querySelectorAll('img');\nimga.forEach(img=>{\n  window.addEventListener('scroll',()=>{\n    let top = img.getBoundingClientRect()['top'];\n    let height = img.getBoundingClientRect()['height']\n    let bottomDistance = (window.pageYOffset + window.innerHeight)\n    console.log(`top=${top}`)\n    console.log(`height=${height}`)\n    console.log(`bottom=${bottomDistance}`)\n    if (top+(height/2) < bottomDistance) {\n      img.classList.add('active')\n      }\n  })\n})\n\n//# sourceURL=webpack:///./src/slide_scroll.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! exports provided: addTodo, populateList */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"addTodo\", function() { return addTodo; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"populateList\", function() { return populateList; });\nlet todos = JSON.parse(localStorage.getItem('todos')) || [];\n// turn todos back into array    \n\n// console.log(todos)\nlet ul = document.getElementsByClassName('todos')[0];\nlet form = document.getElementsByClassName('add-todo-form')[0];\n\nconst addTodo = function(){\n    let input = document.getElementsByName(\"add-todo\")[0];\n    let inputValue = input.value;\n    todos.push({done:false,val:inputValue});\n    input.value = ''\n};\n\n\nconst populateList = function () {\n  ul.innerHTML = ''\n  todos.forEach( todo => {\n    let label = document.createElement(\"label\");\n    label.innerHTML = todo['val'];\n    let input = document.createElement(\"input\");\n    input.setAttribute(\"type\", \"checkbox\");\n      input.dataset.status = todo['done']\n    label.appendChild(input);\n    ul.appendChild(label);\n  })\n}\npopulateList()\nform.addEventListener('submit', (e) => {\n    e.preventDefault()\n    addTodo();\n    populateList();\n    localStorage.setItem('todos', JSON.stringify(todos))\n})\nlet checkBox = Array.from(document.querySelectorAll('input[type = checkbox]'))\ncheckBox.forEach(element => {\n    element.addEventListener('change',()=>{\n        if (element.dataset.status === 'true'){\n            element.dataset.status = false\n        } else { element.dataset.status = true}\n    })\n});\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\n\n\nconst htmlGenerator = (string, htmlElement) => {\n    let ele = document.createElement(\"p\");\n    ele.innerHTML = string\n    if (Array.from(htmlElement.children).length > 0) {\n        htmlElement.innerHTML = ''\n    }\n    htmlElement.appendChild(ele);\n\n};\n\nhtmlGenerator('Party Time.', partyHeader);\n\n\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });