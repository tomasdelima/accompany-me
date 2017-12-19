import React from 'react'

export default class Stateful extends React.Component {
  constructor (props) {
    super(props)
    this.state = this.getInitialState()
  }

  getInitialState () {
    return {}
  }
}
