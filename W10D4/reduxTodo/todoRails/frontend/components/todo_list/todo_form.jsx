import React from "react"

class Form extends React.Component{
    constructor(props){
        super(props);
    }

    uniqueId() {
        return new Date().getTime();
    }

    receiveTodo(){
        event.preventDefault();
        let title = document.getElementsByName("todo[title]")[0].value
        let body = document.getElementsByName("todo[body]")[0].value

        let trueRadio = document.getElementsByName("todo[done]")[0]
        let falseRadio = document.getElementsByName("todo[done]")[1]

        let checked;
        if (trueRadio.checked){
            checked = trueRadio;
        } else if(falseRadio.checked){
            checked = falseRadio;
        }

  
        this.props.receiveTodo({id: this.uniqueId(), title: title, body: body, done: checked})//(title,body,checked);)

        
    }

    render(){
        return(
            <div>
                <form action="">
                    <input type="text" name="todo[title]"/>
                    <input type="text" name="todo[body]"/>
                    <input type="radio" name="todo[done]" value="true"/>
                    <input type="radio" name="todo[done]" value="false"/>
                    <button onClick={(event) => { this.receiveTodo() }}>Create</button>
                </form>
            </div>
        )
    }
}
export default Form;