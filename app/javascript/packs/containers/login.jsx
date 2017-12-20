import React from 'react'
import { connect } from 'react-redux'
import FacebookLogin from 'react-facebook-login'

import { setUser, setData } from '../actions'
import LoginData from '../components/login-data'

const mapStateToProps = (state) => {
  return state
}

const mapDispatchToProps = (dispatch) => {
  return {
    onLogin: (user) => {
      fetch('api/users', {
        method: 'POST',
        headers: {Accept: 'application/json', 'Content-Type': 'application/json'},
        body: JSON.stringify({
          email: user.email,
          facebookId: user.id,
        }),
      }).then((data) => data.json()).then((data) => {
        dispatch(setUser(user))
        dispatch(setData(data))
      })
    },
    onFailure: () => console.log('fail')
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(LoginData)