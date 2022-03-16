
import { createStore, applyMiddleware } from "redux";
import logger from "redux-logger";
import thunk from "redux-thunk";
// import thunk from "redux-thunk"
import RootReducer from "../reducers/root";



const configureStore = (preLoadedState={}) => 
    createStore(RootReducer, preLoadedState, applyMiddleware(thunk, logger))


export default configureStore


// const configureStore = (preloadedState = {}) =>
//   createStore(rootReducer, preloadedState, applyMiddleware(thunk, logger));

// export default configureStore;