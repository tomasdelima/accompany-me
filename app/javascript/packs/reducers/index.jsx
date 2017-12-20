import {createStore, combineReducers} from 'redux'

const user = (state=false, action) => {
  switch (action.type) {
    case 'SET_USER': return action.user
    default: return state
  }
}


export default combineReducers({
  user,
})
