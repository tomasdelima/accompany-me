import React from 'react'
import View from './view'
import s from 'react-quick-styles'

export default class Link extends React.Component {
  render () {
    return <a href={this.props.href} style={(this.props.style || []).merge()} data-method={this.props.method}>{this.props.children || this.props.href}</a>
  }
}
