import {connect} from 'react-redux'
import todoList from "todo_list"
import selectors from "../reducers/selectors"

const mapStateToProps = (state) => ({
    todos: selectors(state)
})

const mapDispatchToProps = dispatch => ({
    receiveTodo: todo => dispatch(receiveTodo(todo))
})

export default connect(mapStateToProps, mapDispatchToProps)(todoList) // todolist prop has todos & receiveTodo
                        // state            dispatch      both coming from store

// curry's pit onto todolist