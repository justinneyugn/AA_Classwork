import React from "react"
import { Link } from "react-router-dom";

class Greeting extends React.Component {
    constructor(props) {
        super(props)
    }

    render() {
        const display = this.props.currentuser ? (
            <div>
                <p>Hello, {this.props.currentUser.username}</p>
                <button onClick={this.props.logout}>log out</button>
            </div>
        ) : (
            <div>
                <Link to="/signup">Sign Up</Link> 
                <br />
                <Link to='/login'>log in </Link>
            </div>
        );
        return (
            <div>
                
                {display}

            </div>
        )
    }
}

export default Greeting