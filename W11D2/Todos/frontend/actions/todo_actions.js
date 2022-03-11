export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

import * as utils from "../util/todo_api_util";

export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos
    };
};

export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo
    };
};

export const removeTodo = (id) => {
    return {
        type: REMOVE_TODO,
        id
    }
}

export const fetchTodos = () => (dispatch) => {
    return utils.getTodos()
        .then(todos => dispatch(receiveTodos(todos)));
}