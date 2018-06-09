import { Controller } from 'stimulus';

export default class extends Controller {
  initialize() {
    this.setCheckboxElement()
    this.setLabelElement()
    this.setInputElement()
  }

  connect() {
    this.update()
  }

  update() {
    this.updateLabel()
    if (this.isDone && this.isHighlighted) {
      this.emitHighlight()
    }
  }

  highlight(e) {
    e.preventDefault()
    this.emitHighlight()
  }

  remove(e) {
    e.preventDefault()
    const event = new Event('todoremoved', { bubbles: true })
    this.element.dispatchEvent(event)
  }

  updateLabel() {
    let textDecoration = 'none'
    if (this.isDone) {
      textDecoration = 'line-through'
    }
    this.label.style.textDecoration = textDecoration
  }

  emitHighlight() {
    const event = new Event('todohightlighted', { bubbles: true })
    this.element.dispatchEvent(event)
  }

  get isDone() {
    return this.checkbox.checked
  }

  get isHighlighted() {
    return this.element.classList.contains('tdl-Item-highlight')
  }

  get index() {
    return parseInt(this.data.get('index'))
  }

  setCheckboxElement() {
    const checkId = `todo-list-item-check-${this.index}`

    this.checkbox = this.element.querySelector('input[type="checkbox"]')
    this.checkbox.id = checkId
    this.checkbox.name = `form[todos][${this.index}][done]`
  }

  setLabelElement() {
    this.label = this.element.querySelector('label')
  }

  setInputElement() {
    this.input = this.element.querySelector('input[type="text"]')
    this.input.name = `form[todos][${this.index}][content]`
  }
}