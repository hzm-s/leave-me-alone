import { Controller } from 'stimulus';

export default class extends Controller {
  initialize() {
    const index = parseInt(this.data.get('index'))
    const checkId = `todo-list-item-check-${index}`

    this.checkbox = this.element.querySelector('input[type="checkbox"]')
    this.checkbox.id = checkId
    this.checkbox.name = `form[todos][${index}][done]`

    this.label = this.element.querySelector('label')
    this.label.setAttribute('for', checkId)

    this.input = this.element.querySelector('input[type="text"]')
    this.input.name = `form[todos][${index}][content]`
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

  highlight(e) {
    e.preventDefault()
    const event = new Event('todohightlighted', { bubbles: true })
    this.element.dispatchEvent(event)
  }

  remove(e) {
    e.preventDefault()
    const event = new Event('todoremoved', { bubbles: true })
    this.element.dispatchEvent(event)
  }
}
