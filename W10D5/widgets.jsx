import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';

document.addEventListener("DOMContentLoaded", () => {
    let root = document.getElementById('root');
    ReactDOM.render(< Clock />, root);
})