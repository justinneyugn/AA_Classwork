import React from 'react';
import ReactDOM from 'react-dom';

document.addEventListener("DOMContentLoaded", () => {
    const content = document.querySelector("#content");
    const h1 = <h1>Todos App</h1>
    ReactDOM.render(h1, content);
})