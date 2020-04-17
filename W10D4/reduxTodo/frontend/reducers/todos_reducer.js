import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todos_actions';


// const initialState = {
//     1: {
//         id: 1,
//         title: "wash car",
//         body: "with soap",
//         done: false
//     },
//     2: {
//         id: 2,
//         title: "wash cat",
//         body: "with butter",
//         done: false
//     }
// };

// todos = [{
//         id: 1,
//         title: "wash cr",
//           body: "with soap",
//           done: false
// }, {
//         id: 2,
//         title: "wash cat",
//         body: "with butter",
//         done: false
//     }]

function convertToObject(arr){
    let hash = {};
    arr.forEach(el=>{
        let newKey = el.id;
        hash[newKey] = el;
    })
    return hash;
}

    
const todosReducer = ( state = {}, action ) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_TODOS: 
        nextState = convertToObject(action.todos)
        return nextState;
    case RECEIVE_TODO:
        nextState[action.todo.id] = action.todo;
        return nextState;
    default:
        return state;
  }
}

export default todosReducer;

// { type: RECEIVE_TEA tea: tea }

// { type: RECEIVE_TEA tea: {flavor: green, amount: 3, id:1 }}

// { type: RECEIVE_TEA todos: { id: X, todo: "abc"} }

// todos populates store
// todo add or edit a single todo
// {
//   1: { 
//     id: 1, // todo.id
//       title: 'wash car',
//         body: 'with soap',
//           done: false
//   },
//   2: {
//     id: 2,
//       title: 'wash dog',
//         body: 'with shampoo',
//           done: true
//   },
// }