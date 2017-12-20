import React from 'react'
import {render} from 'react-dom'
import {Router, Route, Switch} from 'react-router-dom'
import {Provider} from 'react-redux'
import {createStore} from 'redux'
import createBrowserHistory from 'history/createBrowserHistory'

import Data from './containers/data'
import reducers from './reducers'

render(
  <Provider store={createStore(reducers)}>
    <Router history={createBrowserHistory()}>
      <Switch>
        <Route exact path="/" component={Data} />
      </Switch>
    </Router>
  </Provider>,
  document.getElementById('react-root')
)
