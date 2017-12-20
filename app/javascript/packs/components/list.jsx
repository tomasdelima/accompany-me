import React from 'react'
import Item from './item'
import View from './view'

export default class List extends React.Component {
  render () {
    var styles = this.props.styles || {}

    return <div style={styles.container}>
      {this.props.label && <h2 style={styles.label}>{this.props.label}</h2>}
      <View style={styles.list}>
        {this.props.items && this.props.items.map((item, i) =>
          <Item key={i} style={styles.item}>
            {this.props.renderItem ? this.props.renderItem(item) : item}
          </Item>
        )}
      </View>
    </div>
  }
}
