import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['show', 'input']

  connect() {
    this.render(this.value)
  }

  edit(event) {
    event.preventDefault()
    this.inputTarget.value = this.value
    this.inputTarget.focus()
  }

  update() {
    this.data.set('value', this.inputTarget.value)
    this.render(this.value)
  }

  render(value) {
    this.showTarget.innerText = value
    this.inputTarget.value = value
  }

  get value() {
    return this.data.get('value')
  }
}
