import React from 'react'
import FacebookLogin from 'react-facebook-login'
import s from 'react-quick-styles'

import Item from './item'
import View from './view'
import Text from './text'
import Link from './link'

export default class LoginData extends React.Component {
  renderLoginButton () {
    return <View style={[s.center2]}>
      <FacebookLogin
        appId="137748373602430"
        autoLoad={true}
        fields="name,first_name,email,picture"
        onClick={this.props.onClick}
        onFailure={this.props.onFailure}
        language="pt_BR"
        icon="glyphicon glyphicon-book"
        cssClass="login-button"
        textButton="Entre com o Facebook"
        callback={this.props.onLogin}
      />
    </View>
  }

  renderUserData () {
    var user = this.props.user
    // console.log(user)

    return <View style={[s.center2]}>
      <Text style={[s.white, s.padding(0, 10)]}>{user.first_name}</Text>
      <img style={[s.circle(30)].merge()} src={user.picture.data.url}/>
    </View>
  }

  render () {
    return this.props.user ? this.renderUserData() : this.renderLoginButton()
  }
}
