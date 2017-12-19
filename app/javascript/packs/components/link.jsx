import React from 'react'
import Text from './text'
import s from 'react-quick-styles'

export default class Link extends React.Component {
  render () {
    var style = this.props.style || []
    return <Text type="a" href={this.props.href} style={[].concat(style).merge()} data-method={this.props.method}>{this.props.children}</Text>
  }
}
