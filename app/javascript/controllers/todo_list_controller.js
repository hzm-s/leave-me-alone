import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['list']

  connect() {
    this.element.addEventListener('todocreated', (e) => {
      this.addItem(e.detail)
    })
  }

  addItem(payload) {
    const newSize = this.currentSize + 1
    this.data.set('size', newSize)

    const el = this.buildItem(payload.content, newSize - 1)
    this.listTarget.appendChild(el)
  }

  buildItem(content, index) {
    const template = document.querySelector('#tmpl-todo-item')
    const item = template.content.querySelector('[data-content-value]')
    item.dataset.contentValue = content
    const check = template.content.querySelector('[data-check-index]')
    check.dataset.checkIndex = index
    return document.importNode(template.content, true)
  }

  get currentSize() {
    return parseInt(this.data.get('size'))
  }
}
