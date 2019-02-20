export const allTodos = state => {
  return Object.values(state.todos);
}

// reducers/todos_reducer.js
// const initialState = {
//   1: {
//     id: 1,
//     title: 'wash car',
//     body: 'with soap',
//     done: false
//   },
//   2: {
//     id: 2,
//     title: 'wash dog',
//     body: 'with shampoo',
//     done: true
//   },
// };

// TESTING
// window.allTodos = allTodos;