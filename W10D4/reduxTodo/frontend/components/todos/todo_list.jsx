import React from "react"
// import connect from './todo_list_container';

export default (props) => {
  return (
    <ul>
      { props.todos.map ( todo => {
        return ( <li>{ todo.title }</li> )
      }) }
    </ul>
  )
}