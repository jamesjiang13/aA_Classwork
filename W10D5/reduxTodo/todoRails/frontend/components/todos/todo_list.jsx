import React from "react"
import Form from "../todo_list/todo_form"

export default (props) => {
  return (
    <ul>
      { props.todos.map ( todo => {
        return ( <li>{ todo.title }</li> )
      }) }
      <Form receiveTodo={props.receiveTodo}/>
    </ul>
  )
}