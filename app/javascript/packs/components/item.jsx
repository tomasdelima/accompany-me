import React from 'react'

export default class Item extends React.Component {
  render () {
    return <div style={this.props.style}>
      {this.props.children}
    </div>
  }
}
