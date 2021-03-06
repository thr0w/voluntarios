import application,registerView,dependency from '../../lib/himba'
import lista_usuarios from '../../db/demo'


tag voluntariosView
  def render
    <self>
      <ul.demo-list-three.mdl-list> for v in lista_voluntarios
        <li.mdl-list__item.mdl-list__item--three-line>
          <span.mdl-list__item-primary-content>
            <i.material-icons.mdl-list__item-avatar> 'person'
            <span> v['nome']
            <span.mdl-list__item-text-body>
              v['celular']
          <span.mdl-list__item-secondary-content>
            <a.mdl-list__item-secondary-action href="intent://send/{v.whatsapp()}#Intent;scheme=smsto;package=com.whatsapp;action=android.intent.action.SENDTO;end">
              <i.material-icons> 'message'
            <a.mdl-list__item-secondary-action href="tel:{v.telefone()}">
              <i.material-icons> 'phone'

  def lista_voluntarios
    var filtro = application['searchText']
    var ret = lista_usuarios()
    if filtro
      ret = ret.filterWithRelevance do |v|
        v['nome'].l_relevance(filtro)
    return ret

registerView
  url: '/voluntarios'
  render: do |state, params|
    <voluntariosView>
