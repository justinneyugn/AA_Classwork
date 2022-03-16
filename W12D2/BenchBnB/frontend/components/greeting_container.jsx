import { logout } from "../util/sessions";
import { connect } from "react-redux";
import Greeting from "./Greeting";


const mapSTP = state => ({
    currentUser: state.entities.users[state.session.id] 
})

const mapDTP = dispatch => ({
    logout: currentUser => dispatch(logout(currentUser.id))
})


export default connect(mapSTP, mapDTP)(Greeting)



