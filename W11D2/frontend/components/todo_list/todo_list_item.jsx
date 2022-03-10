import React from "react";
import { receiveTodo } from "../../actions/todo_actions";
import TodoDetailViewContainer from '../todos/todo_detail_view_container'


class TodoListItem extends React.Component{
  constructor(props){
    super(props)
    this.state = {detail: false}
    this.handleDone = this.handleDone.bind(this);
    this.handleDetail = this.handleDetail.bind(this);
    this.showDetail = this.showDetail.bind(this);


  }

  handleDone(todo){
    todo.done = !todo.done;
    return todo;
  }

  handleDetail(){
    this.setState({detail: !this.state.detail})
  }

  showDetail(){
    if (this.state.detail){
      return < TodoDetailViewContainer todo={this.props.todo}/>
    } else {
      return 
    }
  }

  render(){
    return (
      <li>
        <h3 onClick={() => this.handleDetail()}>{this.props.todo.title}</h3>
        {this.showDetail()}
        <button onClick={(e) => {
          receiveTodo(this.handleDone(this.props.todo))
          if (this.props.todo.done) {
            e.target.innerHTML = "Undo"
          } else {
            e.target.innerHTML = "Done"
          }
          }}>
        Done
        </button>
      </li>
    )
  }
}


export default TodoListItem;