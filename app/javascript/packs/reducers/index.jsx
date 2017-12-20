import {createStore, combineReducers} from 'redux'

const user = (state=false, action) => {
  switch (action.type) {
    case 'SET_USER': return action.user
    default: return state
  }
}

const data = (state={}, action) => {
  switch (action.type) {
    case 'SET_DATA': return action.data
    default: return state
  }
}

export default combineReducers({
  user,
  data,
})
