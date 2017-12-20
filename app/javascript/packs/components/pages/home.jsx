import React from 'react'

import View from '../view'
import List from '../list'
import Item from '../item'

export default class Home extends React.Component {
  render () {
    return <View>
      {this.props.data && <List items={this.props.data.friends}/>}
    </View>
  }
}
