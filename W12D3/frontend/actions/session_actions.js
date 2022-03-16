import { signup, login, logout } from "../utils/session";

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

const receiveCurrentUser = currentUser => ({
    type: RECEIVE_CURRENT_USER,
    currentUser,
});

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
});

export const signup = user => dispatch => signup(user)
    .then(user => dispatch(receiveCurrentUser(user)));

export const login = user => dispatch => login(user)
    .then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => logout()
    .then(() => dispatch(logoutCurrentUser()))