
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export const dogLinkCreator = function(){
  let dogArray = []
  Object.keys(dogs).forEach(dog => {
    let a = document.createElement('a');
    a.innerHTML = dog;
    a.setAttribute('href',dogs[dog]);
    let li = document.createElement('li');
    li.classList.add('dog-link');
    li.appendChild(a);
    dogArray.push(li);
  });
  return dogArray;
};

export const attachDogLinks = function(){
  let dogLinks = dogLinkCreator();
  let ul = document.getElementsByClassName("drop-down-dog-list")[0];
  
  dogLinks.forEach( el => {
    ul.appendChild(el);
  })
}

export const handleEnter = function() {
  
  let links = document.getElementsByClassName("dog-link");
  let arr = Array.from(links);
  arr.forEach( link => {
    link.classList.add("hovered");
  })
}

export const handleLeave = function() {
 
  let links = document.getElementsByClassName("dog-link");
  let arr = Array.from(links);
  arr.forEach( link => {
    link.classList.remove("hovered");
  })
}

let nav = document.getElementsByClassName("drop-down-dog-nav")[0];

nav.addEventListener("mouseenter", handleEnter);
nav.addEventListener("mouseleave", handleLeave);

attachDogLinks();
