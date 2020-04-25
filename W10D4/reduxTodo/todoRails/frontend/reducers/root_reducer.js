import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';

const rootReducer = combineReducers({
  todos: todosReducer,
  cookies: () => ({})
})


export default rootReducer;