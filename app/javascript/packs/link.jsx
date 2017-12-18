import React from 'react'
import Text from './text'
import s from 'react-quick-styles'

export default class Link extends React.Component {
  render () {
    var style = this.props.style || []
    return <Text style={[this.props.style.merge()].merge()} data-method={this.props.method}>{this.props.children}</Text>
  }
}
