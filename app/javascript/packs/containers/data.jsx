import React from 'react'
import { connect } from 'react-redux'
import FacebookLogin from 'react-facebook-login'

import Pages from '../components/pages'

const mapStateToProps = (state) => {
  return state
}

const mapDispatchToProps = (dispatch) => {
  return {}
}

export default connect(mapStateToProps, mapDispatchToProps)(Pages)