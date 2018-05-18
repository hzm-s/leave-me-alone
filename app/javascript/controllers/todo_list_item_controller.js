import { Controller } from 'stimulus';

export default class extends Controller {
  initialize() {
    const checkId = `todo-list-item-check-${this.data.get('index')}`

    this.checkbox = this.element.querySelector('input[type="checkbox"]')
    this.checkbox.id = checkId

    this.label = this.element.querySelector('label')
    this.label.setAttribute('for', checkId)
  }

  connect() {
    this.observeTimer = setInterval(() => {
      let textDecoration = 'none'
      if (this.checkbox.checked) {
        textDecoration = 'line-through'
      }
      this.label.style.textDecoration = textDecoration
    }, 200)
  }

  disconnect() {
    if (this.observeTimer) {
      clearInterval(this.observeTimer)
    }
  }
}
