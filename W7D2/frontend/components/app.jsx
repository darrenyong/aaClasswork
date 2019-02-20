import React from 'react'; 
import { TodoListContainer } from './todos/todo_list_container';
import TodoForm from './todo_list/todo_form';

const App = () => (
  <>
    <h1>Hello, this is our App.</h1>
    <TodoListContainer />
  </>
);

export default App;


// What is the point of App.jsx vs Root.jsx?
// Can you clarify where the store goes?
// What goes in the App.jsx?
// What is the App supposed to render?
// When do we need props in Root and props.store?