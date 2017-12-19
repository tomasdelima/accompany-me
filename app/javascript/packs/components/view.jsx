import React from 'react'

export default class View extends React.Component {
  render () {

    if (Object.keys(this.props).indexOf("if") == -1 || this.props.if) {
      return <div style={(this.props.style || []).merge()}>{this.props.children}</div>
    } else {
      return null
    }
  }
}