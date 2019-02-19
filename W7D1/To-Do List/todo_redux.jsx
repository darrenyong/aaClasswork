import React from 'react';
import ReactDOM from 'react-dom';

import { createStore } from 'redux';
import reducer from './frontend/reducers/root_reducer';
import App from './frontend/components/app';

function Root() {
  return(
    <>
      <h1>React is working</h1>
    </>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const store = createStore(reducer);
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);
})