import React from 'react'
import Item from './item'
import View from './view'
import Link from './link'
import s from 'react-quick-styles'

export default class List extends React.Component {
  render () {
    var styles = this.props.styles || {}

    return <View style={[s.flex, s.spacedIn, s.center2, s.padding(10), s.BG('#004080')]}>
      <Link href="/" style={[s.size(25), s.white, s.noDecoration]}>Accompany-me</Link>

      <View if={currentUser.email}>
        {currentUser.email}
        <View>
          <Link href="/users/sign_out" style={[s.white]} method="delete">Sair</Link>
          <a rel="nofollow" data-method="delete" href="/users/sign_out">Logout</a>
        </View>
      </View>
    </View>
  }
}
