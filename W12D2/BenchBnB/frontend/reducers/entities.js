import { combineReducers } from "redux";

import UsersReducer from "./users";

const EntitiesReducer = combineReducers({
    users: UsersReducer
});

export default EntitiesReducer;