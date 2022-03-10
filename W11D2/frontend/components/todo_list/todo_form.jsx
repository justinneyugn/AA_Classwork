import React from "react";
import { uniqueId } from "./todo_util"

class TodoForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      id: uniqueId(),
      title: "",
      body: "",
      done: false
    }
    console.log(this.props.receiveTodo)
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({
      id: uniqueId(),
      title: "",
      body: "",
      done: false
    });
  }

  updateTitle(e) {
    this.setState({
      title: e.target.value
    })
  }

  updateBody(e) {
    this.setState({
      body: e.target.value
    })
  }

  render() {

    return (
      <form onSubmit={this.handleSubmit}>
        <h3>Add a Todo</h3>
        <label>Title:
          <input type="text" value={this.state.title} onChange={this.updateTitle}/>
        </label>
        <br />
        <label>Body:
          <input type="text" value={this.state.body} onChange={this.updateBody}/>
        </label>
        <br />
        <input type="submit" value="Add Todo"/>
      </form>
    )
  }
}

export default TodoForm;