import { combineReducers } from "redux";
import SessionReducer from "./session";
import EntitiesReducer  from "./entities";
import ErrorsReducer from "./errors";


const RootReducer = combineReducers({
    session: SessionReducer,
    entities: EntitiesReducer,
    errors: ErrorsReducer
})

export default RootReducer
