import React from "react";

const TodoDetailView = (props) => {
    console.log(props)
    return (
        <div>
            <article>{props.todo.body}</article>
            <button onClick={() => props.removeTodo(props.todo.id)}>Delete</button>
        </div>
    )
};

export default TodoDetailView;