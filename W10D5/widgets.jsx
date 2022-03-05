import React from 'react';
import ReactDOM from 'react-dom';
import Root from './Root'

document.addEventListener("DOMContentLoaded", () => {
    let root = document.getElementById('root');
    let names = ['Kenneth', 'Justin', 'Paulo', 'Chris', 'Mike'];

    ReactDOM.render(< Root name={names}/>, root);
})