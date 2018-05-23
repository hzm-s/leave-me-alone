import { Controller } from 'stimulus'

export default class extends Controller {
  connect() {
    this.element.addEventListener('formchanged', (e) => {
      this.willSubmit = true
    })
    this.submitTimer = setInterval(() => { this.detect() }, 1000 * 1)
  }

  disconnect() {
    if (this.submitTimer) {
      clearInterval(this.submitTimer)
    }
  }

  detect() {
    console.log('detect', this.willSubmit)
    if (this.willSubmit) {
      this.submit()
    }
  }

  submit() {
    this.element.submit()
    this.willSubmit = false
  }
}
