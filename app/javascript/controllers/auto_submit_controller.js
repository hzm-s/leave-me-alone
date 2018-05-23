import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['submit']

  connect() {
    this.element.addEventListener('formchanged', (e) => {
      this.willSubmit = true
    })
    this.element.addEventListener('change', (e) => {
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
    if (this.willSubmit) {
      this.submit()
    }
  }

  submit() {
    this.submitTarget.click()
    this.willSubmit = false
  }
}
