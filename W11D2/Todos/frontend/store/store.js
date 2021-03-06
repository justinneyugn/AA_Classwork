import { createStore } from "redux";
import rootReducer from "../reducers/root_reducer";
import { applyMiddleware } from "redux";
import { thunk } from "../middleware/thunk";

const configureStore = (preLoadedState = ({})) => {
  return createStore(rootReducer, preLoadedState, applyMiddleware(thunk));
}

export default configureStore;