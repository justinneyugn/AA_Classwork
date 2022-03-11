import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store"
import { receiveTodo, receiveTodos, removeTodo } from "./actions/todo_actions"
// import { receiveTodos } from "./actions/todo_actions"
// import { removeTodo } from "./actions/todo_actions"
import { receiveSteps,  receiveStep, removeStep} from "./actions/step_actions"
// import { receiveStep } from "./actions/step_actions"
// import { removeStep } from "./actions/step_actions"
import App from "./components/app"
import Root from "./components/root"
import {allTodos, stepsByTodoId} from "./reducers/selectors"
import { fetchTodos } from "./actions/todo_actions"

document.addEventListener("DOMContentLoaded", () => {
    const root = document.querySelector("#root");
    const store = configureStore();

    ReactDOM.render(<Root store={store}/>, root);

    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.removeTodo = removeTodo;
    window.receiveStep = receiveStep;
    window.receiveSteps = receiveSteps;
    window.removeStep = removeStep;
    window.allTodos = allTodos;
    window.stepsByTodoId = stepsByTodoId;
    window.fetchTodos = fetchTodos;
})