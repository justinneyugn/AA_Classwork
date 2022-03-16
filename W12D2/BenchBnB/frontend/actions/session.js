import * as Sessions from "../util/sessions";

export const RECEIVE_USER = "RECEIVE_USER";
export const LOGOUT_USER = "LOGOUT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS"

const receiveUser = user => ({
    type: RECEIVE_USER,
    user
})

const logoutUser = userId => ({
    type: LOGOUT_USER,
    userId
})

export const receiveErrors = errors => {
    return ({
        type: RECEIVE_SESSION_ERRORS,
        errors
    })
} 

export const login = user => dispatch => {
    return Sessions.login(user)
        .then(user => dispatch(receiveUser(user)))
}

export const signup = user => dispatch => {
    return Sessions.signup(user)
        .then(user => dispatch(receiveUser(user)))
}

export const logout = userId => dispatch => {
    return Sessions.logout(userId)
        .then(user => dispatch(logoutUser(user.id)))
}