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

const getConfig = initReactDevise({
  // clientResourceName: 'users',
  apiResourceName: 'users',
  // apiHost: 'http://auth.example.com',
  // defaultViewPluginSettings: myDefaultViewPluginSettings,
  // viewPlugins: myPlugins,
  // messages: customMessages,
  routes: {
    signup: {
      path: '/signup-for-fun-and-profit'
    }
  }
})

const store = createStore(
  combineReducers({
    // ...reducers,
    ...reactDeviseReducers
  })
)

function authorize () {
  return {
    authorized: currentUser,
  }
}

        // <Route exact path="/users/login" component={SignInPage} />
render(
  <Provider store={store}>
    <Router history={createBrowserHistory()}>
      <Switch>
        <PrivateRoute exact path="/" component={Page} authorize={authorize} />
        {authRoutes()}
      </Switch>
    </Router>
  </Provider>,
  document.getElementById('react-root')
)
