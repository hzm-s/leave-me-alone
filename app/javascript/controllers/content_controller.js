import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['show', 'input']

  initialize() {
    this.render(this.value)
  }

  connect() {
    this.inputTarget.addEventListener('submit', (e) => {
      this.update()
    })

    this.inputTarget.addEventListener('keypress', (e) => {
      const key = e.which || e.keyCode
      if (key == 13) {
        const submitEvent = new Event('submit')
        this.inputTarget.dispatchEvent(submitEvent)
      }
    })
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
