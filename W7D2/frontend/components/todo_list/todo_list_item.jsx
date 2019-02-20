import React from 'react';


// class TodoListItem extends React.Component {
//   constructor(props) {
//     super(props);
//   }

//   render(){
//     return (
//       console.log(this.props)
//       // <li>{this.props.title}</li>
//     );
//   }
// }


const TodoListItem = (props) => {
  return (
    <li>{props.todo.title}</li>
  );
}

export default TodoListItem;