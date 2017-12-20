import React from 'react'
import { connect } from 'react-redux'
import FacebookLogin from 'react-facebook-login'
import s from 'react-quick-styles'

import { setUser } from '../actions'
import Page from '../components/page'
import LoginData from '../components/login-data'

const mapStateToProps = (state) => {
  return state
}

const mapDispatchToProps = (dispatch) => {
  return {
    onLogin: (user) => dispatch(setUser(user)),
    onFailure: () => console.log('fail')
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(LoginData)