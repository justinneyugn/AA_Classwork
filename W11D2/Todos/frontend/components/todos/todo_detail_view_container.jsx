import { connect } from "react-redux";
import { removeTodo } from "../../actions/todo_actions";
import { receiveSteps } from "../../actions/step_actions"
import TodoDetailView from "../todo_list/todo_detail_view";

const mapDispatchToProps = (dispatch) => {
    return {
        removeTodo: (todo) => dispatch(removeTodo(todo)),
        receiveSteps: (steps) => dispatch(receiveSteps(steps))
    }
}

export default connect(null, mapDispatchToProps)(TodoDetailView);
