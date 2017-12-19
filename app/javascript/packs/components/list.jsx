import React from 'react'
import Item from './item'

export default class List extends React.Component {
  render () {
    var styles = this.props.styles || {}

    return <div style={styles.list}>
      {this.props.items.map((item, i) => <Item key={i} style={styles.item}>{item}</Item>)}
    </div>
  }
}
