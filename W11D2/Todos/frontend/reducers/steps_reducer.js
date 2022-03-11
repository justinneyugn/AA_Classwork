import { RECEIVE_STEPS } from "../actions/step_actions"
import { RECEIVE_STEP } from "../actions/step_actions"
import { REMOVE_STEP } from "../actions/step_actions"

const stepsReducer = (state = {}, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    
    switch (action.type){
        case RECEIVE_STEPS:
            action.steps.forEach(step => {
                nextState[step.id] = step; 
            });
            return nextState;
        case RECEIVE_STEP:
            nextState[action.step.id] = action.step; 
            return nextState;
        case REMOVE_STEP:
            delete nextState[action.id];
            return nextState;
        default:
            return state;
    }
};

export default stepsReducer;