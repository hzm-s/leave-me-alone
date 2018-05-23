import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['list']

  connect() {
    this.element.addEventListener('todocreated', (e) => {
      this.addItem(e.detail)
    })

    this.element.addEventListener('todoremoved', (e) => {
      this.removeItem(e.target)
    })
  }

  addItem(payload) {
    const newSize = this.currentSize + 1
    this.data.set('size', newSize)

    const el = this.buildItem(payload.content, newSize - 1)
    this.listTarget.appendChild(el)

    this.emitChanged()
  }

  buildItem(content, index) {
    const template = document.querySelector('#tmpl-todo-item')
    const item = template.content.querySelector('[data-content-value]')
    item.dataset.contentValue = content
    const check = template.content.querySelector('[data-todo-list-item-index]')
    check.dataset.todoListItemIndex = index
    return document.importNode(template.content, true)
  }

  removeItem(element) {
    element.parentNode.removeChild(element)
    this.emitChanged()
  }

  emitChanged() {
    const event = new Event('formchanged', { bubbles: true })
    this.element.dispatchEvent(event)
  }

  get currentSize() {
    return parseInt(this.data.get('size'))
  }
}
