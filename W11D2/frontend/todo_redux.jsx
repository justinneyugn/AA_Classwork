import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store"
import { receiveTodo } from "./actions/todo_actions"
import { receiveTodos } from "./actions/todo_actions"
import { removeTodo } from "./actions/todo_actions"

document.addEventListener("DOMContentLoaded", () => {
    const content = document.querySelector("#content");
    const h1 = <h1>Todos App</h1>
    const store = configureStore();
    ReactDOM.render(h1, content);

    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.removeTodo = removeTodo;
})