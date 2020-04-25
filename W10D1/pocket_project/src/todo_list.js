let todos = JSON.parse(localStorage.getItem('todos')) || [];
// turn todos back into array    

// console.log(todos)
let ul = document.getElementsByClassName('todos')[0];
let form = document.getElementsByClassName('add-todo-form')[0];

export const addTodo = function(){
    let input = document.getElementsByName("add-todo")[0];
    let inputValue = input.value;
    todos.push({done:false,val:inputValue});
    input.value = ''
};


export const populateList = function () {
  ul.innerHTML = ''
  todos.forEach( todo => {
    let label = document.createElement("label");
    label.innerHTML = todo['val'];
    let input = document.createElement("input");
    input.setAttribute("type", "checkbox");
      input.dataset.status = todo['done']
    label.appendChild(input);
    ul.appendChild(label);
  })
}
populateList()
form.addEventListener('submit', (e) => {
    e.preventDefault()
    addTodo();
    populateList();
    localStorage.setItem('todos', JSON.stringify(todos))
})
let checkBox = Array.from(document.querySelectorAll('input[type = checkbox]'))
checkBox.forEach(element => {
    element.addEventListener('change',()=>{
        if (element.dataset.status === 'true'){
            element.dataset.status = false
        } else { element.dataset.status = true}
    })
});





