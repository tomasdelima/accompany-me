import React from 'react'
import {render} from 'react-dom'
import {Router, Route, Switch} from 'react-router-dom'
import {initReactDevise, authRoutes, PrivateRoute} from 'react-devise'
import {Provider} from 'react-redux'
import {createStore, combineReducers} from 'redux'
// import reducers from './reducers'
import reactDeviseReducers from 'react-devise/lib/reducers'
import createBrowserHistory from 'history/createBrowserHistory'

import Page from './page'
import SignInPage from './sign-in-page'


const store = createStore(
  combineReducers({
    a: () => 1,
    // ...reducers,
  })
)

render(
  <Provider store={store}>
    <Router history={createBrowserHistory()}>
      <Switch>
        <Route exact path="/" component={Page} />
      </Switch>
    </Router>
  </Provider>,
  document.getElementById('react-root')
)
