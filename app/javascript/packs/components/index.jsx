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
// import SignInPage from './sign-in-page'


const store = createStore(
  (state, action) => {
    switch (action.type) {
      case 'FBLogin': return 'logged'
      default: return 'logged-out'
    }
  }
  // combineReducers({
  //   a: () => 1,
  //   // ...reducers,
  // })
)



// store.dispatch({ type: '' })
// store.dispatch({ type: 'FBLogin' })
// store.dispatch({ type: '' })

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

setTimeout(() => {
  store.dispatch({ type: 'FBLogin' })
  console.log(store.getState())
  setTimeout(() => {
    store.dispatch({ type: '' })
    console.log(store.getState())
    setTimeout(() => {
      store.dispatch({ type: 'FBLogin' })
      console.log(store.getState())
      setTimeout(() => {
        store.dispatch({ type: '' })
        console.log(store.getState())
      }, 1000)
    }, 1000)
  }, 1000)
}, 1000)
