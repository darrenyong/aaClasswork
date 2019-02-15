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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\nclass DOMNodeCollection {\n    constructor(array) {\n        this.collection = array;\n    }\n\n    html(str) {\n        // console.log(this[0]);\n        if (!str) {\n            return this.collection[0].innerHTML;\n        } else {\n            this.collection[0].innerHTML = str;\n        }\n    }\n\n    empty() {\n        this.collection.forEach(node => {\n            node.innerHTML = '';\n        });\n    }\n\n    append(el) {\n\n        let outhtml;\n\n        if (typeof el === 'string') {\n            this.collection.forEach(node => {\n                node.innerHTML += el;\n            });\n        } else if (el instanceof HTMLElement) {\n            this.collection.forEach(node => {\n                node.innerHTML += el.outerHTML;\n            });\n        } else if (el instanceof DOMNodeCollection) {\n            el.collection.forEach(argNode => {\n                this.collection.forEach(appendToNode => {\n                    appendToNode.innerHTML += argNode.outerHTML;\n                });\n            });\n        } else {}\n    }\n\n    attr(name, value) {\n        if (!value) {\n            return this.collection[0].getAttribute(name);\n        } else {\n            this.collection[0].setAttribute(name, value);\n        }\n    }\n\n    addClass(value) {\n        this.collection[0].className += ` ${value}`;\n    }\n\n    removeClass(value) {\n        if (!value) {\n            this.collection[0].className = \"\";    \n        } else {\n            let classArr = this.collection[0].className.split(\" \");\n            classArr = classArr.filter((ele) => ele != value);\n            this.collection[0].className = classArr.join(\" \");\n        }\n    }\n}\n\n\n\n\n\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (DOMNodeCollection);\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _dom_node_collection__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\n\n\nfunction $l (arg) {\n    if (typeof arg === 'string') {\n        let arr = Array.from(document.querySelectorAll(arg));\n        return new _dom_node_collection__WEBPACK_IMPORTED_MODULE_0__[\"default\"](arr);\n        // return new DOMNodeCollection(document.querySelectorAll(arg));\n    } else if (arg instanceof HTMLElement) {\n        return new _dom_node_collection__WEBPACK_IMPORTED_MODULE_0__[\"default\"]([arg]);\n    } else {}\n}\n\n\n\nwindow.$l = $l;\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });