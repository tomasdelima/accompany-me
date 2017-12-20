import React from 'react'
import {render} from 'react-dom'
import {Router, Route, Switch} from 'react-router-dom'
import {initReactDevise, authRoutes, PrivateRoute} from 'react-devise'
import {Provider} from 'react-redux'
import {createStore} from 'redux'
import reducers from './reducers'
import reactDeviseReducers from 'react-devise/lib/reducers'
import createBrowserHistory from 'history/createBrowserHistory'

import Login from './containers/login'
import Page from './components/page'

render(
  <Provider store={createStore(reducers)}>
    <Router history={createBrowserHistory()}>
      <Switch>
        <Route exact path="/" component={Page} />
      </Switch>
    </Router>
  </Provider>,
  document.getElementById('react-root')
)
