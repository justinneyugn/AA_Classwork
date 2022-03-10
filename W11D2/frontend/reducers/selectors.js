import React from 'react';

const allTodos = (state) => {
    return (
        Object.values(state.todos)
    )
}

const stepsByTodoId = (state, todoId) => {
    const steps = Object.values(state.steps)
    return steps.filter(step => step.todoId === todoId)
}
export { allTodos, stepsByTodoId } ;