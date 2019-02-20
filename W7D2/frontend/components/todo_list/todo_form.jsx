import React from 'react'
import { receiveTodo } from '../../actions/todo_actions';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: ""
    };
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateTitle(event) {
    this.setState({title: event.currentTarget.value});
  }

  updateBody(event) {
    this.setState({body: event.currentTarget.value});
  }
  
  handleSubmit(event) {
    // debugger;
    event.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({title: "", body: ""});
  }


  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        
        <label>Title
        <input onChange={this.updateTitle} type="text" value={this.state.title}/>
        </label>
        <br />
        <label>Body
        <input onChange={this.updateBody} type="textarea" value={this.state.body}/>
        </label>
        <input type="submit" value="Add Todo"/>
      </form>
    )
  }
}

export default TodoForm;