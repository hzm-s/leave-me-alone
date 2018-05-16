import { Controller } from 'stimulus';

export default class extends Controller {
  connect() {
    this.checkbox = this.element.querySelector('input[type="checkbox"]')
    this.label = this.element.querySelector('label')

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
