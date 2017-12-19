import React from 'react'
import FacebookLogin from 'react-facebook-login'
import s from 'react-quick-styles'

import Stateful from './stateful'
import Page from './page'
import Item from './item'
import View from './view'
import Text from './text'
import Link from './link'

export default class SignInPage extends Stateful {
  getInitialState () {
    return {}
  }

  facebookLoginResponse (response) {
  }

  render () {
    var style = this.props.style || {}

    return <View style={[]}>
      <TopBar/>
      {this.state.foo}
      <FacebookLogin
        appId="137748373602430"
        autoLoad={true}
        fields="name,email,picture"
        onClick={this.onClick}
        callback={this.facebookLoginResponse} />
    </View>
  }
}
