import React from 'react'

import Stateful from '../../stateful'
// import View from '../view'
import List from '../list'
// import Item from '../item'
import TopBar from '../top-bar'
// import Home from './home'

export default class Pages extends Stateful {
  render () {
    var data = this.props.data

    return <div style={{}}>
      <TopBar/>
      <List label="Contatos"        items={data.contacts}           renderItem={(i) => i.email}/>
      <List label="Amigos"          items={data.friends}            renderItem={(i) => i.email}/>
      <List label="Acompanhamentos" items={data.all_accompaniments} renderItem={(i) => i.subject}/>
      <List label="Atividades"      items={data.all_activities}     renderItem={(i) => i.name}/>
      <List label="Experiencias"    items={data.all_experiences}    renderItem={(i) => i.description}/>
      <List label="Aprendizados"    items={data.all_learnings}      renderItem={(i) => i.summary}/>
    </div>
  }
}
