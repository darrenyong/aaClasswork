import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form'

export default (props) =>{
  // debugger
  const list = props.todos.map ( (ele) => {
    return <TodoListItem todo={ele} />
  });
  return (
    <>
      <TodoForm receiveTodo={props.receiveTodo}/> 
      {list}
    </>
  )
}