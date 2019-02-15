class DOMNodeCollection {
    constructor(array) {
        this.collection = array;
    }

    html(str) {
        // console.log(this[0]);
        if (!str) {
            return this.collection[0].innerHTML;
        } else {
            this.collection[0].innerHTML = str;
        }
    }

    empty() {
        this.collection.forEach(node => {
            node.innerHTML = '';
        });
    }

    append(el) {

        let outhtml;

        if (typeof el === 'string') {
            this.collection.forEach(node => {
                node.innerHTML += el;
            });
        } else if (el instanceof HTMLElement) {
            this.collection.forEach(node => {
                node.innerHTML += el.outerHTML;
            });
        } else if (el instanceof DOMNodeCollection) {
            el.collection.forEach(argNode => {
                this.collection.forEach(appendToNode => {
                    appendToNode.innerHTML += argNode.outerHTML;
                });
            });
        } else {}
    }

    attr(name, value) {
        if (!value) {
            return this.collection[0].getAttribute(name);
        } else {
            this.collection[0].setAttribute(name, value);
        }
    }

    addClass(value) {
        this.collection[0].className += ` ${value}`;
    }

    removeClass(value) {
        if (!value) {
            this.collection[0].className = "";    
        } else {
            let classArr = this.collection[0].className.split(" ");
            classArr = classArr.filter((ele) => ele != value);
            this.collection[0].className = classArr.join(" ");
        }
    }
}






export default DOMNodeCollection;