import { combineReducers } from 'redux';
import { RECEIVE_TODOS, RECEIVE_TODO }  from '../actions/todo_actions'
import { receiveTodos, receiveTodo } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};


export const todosReducer = (state = initialState, action) => {
  let newTodo = {}
  switch(action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach( todo => {
        newTodo[todo.id] = todo;
      });
      return newTodo;
    case RECEIVE_TODO:
      newTodo = Object.assign({}, state)
      newTodo[action.todo.id] = action.todo;
      return newTodo;
    default:
      return state;
  }
}

window.todosReducer = todosReducer;
