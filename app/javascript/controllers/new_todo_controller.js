import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['content']

  connect() {
    this.contentTarget.focus()
  }

  create(e) {
    e.preventDefault()

    const payload = { content: this.contentTarget.value }
    const event = new CustomEvent('todocreated', { bubbles: true, detail: payload })
    this.element.dispatchEvent(event)
    this.contentTarget.value = ''
  }
}
