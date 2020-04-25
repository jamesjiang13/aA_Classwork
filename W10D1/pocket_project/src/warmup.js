
const partyHeader = document.getElementById('party');



export const htmlGenerator = (string, htmlElement) => {
    let ele = document.createElement("p");
    ele.innerHTML = string
    if (Array.from(htmlElement.children).length > 0) {
        htmlElement.innerHTML = ''
    }
    htmlElement.appendChild(ele);

};

htmlGenerator('Party Time.', partyHeader);

