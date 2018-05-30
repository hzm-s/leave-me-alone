import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['list', 'item']

  initialize() {
    this.highlightItemClass = this.data.get('highlightItemClass')
  }

  connect() {
    this.element.addEventListener('todocreated', (e) => {
      this.addItem(e.detail)
    })

    this.element.addEventListener('todoremoved', (e) => {
      this.removeItem(e.target)
    })

    this.element.addEventListener('todohightlighted', (e) => {
      this.highlightItem(e.target)
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

  highlightItem(element) {
    this.itemTargets.forEach((el) => {
      if (el == element) {
        el.classList.toggle(this.highlightItemClass)
      } else {
        el.classList.toggle(this.highlightItemClass, false)
      }
    })
  }

  removeDoneItems(e) {
    e.preventDefault()
    this.itemTargets.forEach((el) => {
      const done = el.querySelector('input[type=checkbox]').checked
      if (done) {
        this.removeItem(el)
      }
    })
  }

  emitChanged() {
    const event = new Event('formchanged', { bubbles: true })
    this.element.dispatchEvent(event)
  }

  get currentSize() {
    return parseInt(this.data.get('size'))
  }
}
