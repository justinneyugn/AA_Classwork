import React from "react";
import ReactDOM from "react-dom";
import { signUp, logIn, logOut } from './util/session_api_util';
import configureStore from './store/store';
import Root from "./components/root";

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const store = configureStore();
    ReactDOM.render(<Root store={store}/>, root);

    window.signup = signUp;
    window.login = logIn;
    window.logout = logOut;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
});