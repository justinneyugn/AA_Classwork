import { connect } from "react-redux";
import { receiveStep } from "../../actions/step_actions";
import { allTodos, stepsByTodoId } from "../../reducers/selectors";


const mapStateToProps = (state) => {
    console.log(state)
    return {
        steps: stepsByTodoId(steps, state.todo.id)
    }
}

const mapDispatchToProps = (dispatch) => {
    return {
        receiveStep: (step) => dispatch(receiveStep(step))
    }
}

// export default connect(mapStateToProps, mapDispatchToProps)();
