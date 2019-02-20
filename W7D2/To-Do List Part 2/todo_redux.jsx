import React from 'react';
import ReactDOM from 'react-dom';

import { createStore } from 'redux';
import reducer from './frontend/reducers/root_reducer';
import Root from './frontend/components/root';

document.addEventListener('DOMContentLoaded', () => {
  const store = createStore(reducer);
  window.store = store;
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);
})

// Testing