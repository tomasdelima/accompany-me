import React from 'react'
import s from 'react-quick-styles'

export default class Text extends React.Component {
  render () {
    var style = this.props.style || []

    return React.createElement(
      this.props.type || 'span',
      {...this.props, style: [s.flex, s.center2].concat(style).merge()},
      this.props.children || this.props.href
    )
  }
}
