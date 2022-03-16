import { RECEIVE_SESSION_ERRORS, RECEIVE_USER } from "../actions/session";

const SessionErrorsReducer = (state = [], action) => {
    Object.freeze(state);

    switch (action.type) {
        case RECEIVE_SESSION_ERRORS:
            let newState = Object.assign([], state);
            newState.push(action.errors)
            return newState;
        case RECEIVE_USER:
            return [];
        default:
            return state;
    }
};

export default SessionErrorsReducer