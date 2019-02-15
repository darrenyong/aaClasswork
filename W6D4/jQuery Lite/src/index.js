import DOMNodeCollection from './dom_node_collection';

function $l (arg) {
    if (typeof arg === 'string') {
        let arr = Array.from(document.querySelectorAll(arg));
        return new DOMNodeCollection(arr);
        // return new DOMNodeCollection(document.querySelectorAll(arg));
    } else if (arg instanceof HTMLElement) {
        return new DOMNodeCollection([arg]);
    } else {}
}



window.$l = $l;