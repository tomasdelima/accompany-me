import React from 'react'
import Item from './item'
import View from './view'
import Text from './text'
import Link from './link'
import s from 'react-quick-styles'

export default class List extends React.Component {
  render () {
    var style = this.props.style || {}

    return <View style={[s.flex, s.spacedIn, s.stretch2, s.high(50), s.BG('#004080')]}>
      <Link href="/" style={[s.size(25), s.padding(0, 15), s.white, s.noDecoration]}>Accompany-me</Link>

      <View if={currentUser.email} style={[s.flex]}>
        <Text style={[s.white, s.padding(0, 10)]}>{currentUser.email}</Text>
        <Link href="/users/sign_out" style={[s.white, s.padding(0, 10)]} method="delete">Sair</Link>
      </View>
    </View>
  }
}
