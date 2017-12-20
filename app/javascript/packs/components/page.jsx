import React from 'react'
import { connect } from 'react-redux'
import List from './list'
import Item from './item'
import TopBar from './top-bar'

export default class Page extends React.Component {
  render () {
    return <div style={{}}>
      <TopBar/>
      Page
    </div>
  }
}
