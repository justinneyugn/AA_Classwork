import React from "react";
import { receiveTodo } from "../../actions/todo_actions";

const handleDone = (todo) => {
  todo.done = !todo.done;
  console.log(todo.done);
  return todo;
}

const doneText = (todo) => {
  if (todo.done) {
    return "undo"
  } else {
    return "done"
  }
}

const TodoListItem = (props) => {
  return (
    <li>
      {props.todo.title}
      <button onClick={() => props.removeTodo(props.todo.id)}>Delete</button>
      {/* look into e and change innerHTML */}
      <button onClick={() => receiveTodo(handleDone(props.todo))}>{doneText(props.todo)}</button>
    </li>
  )
};

export default TodoListItem;