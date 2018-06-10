import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['submit', 'status']

  initialize() {
    this.setSubmitInterval()

    this.element.addEventListener('formchanged', (e) => {
      this.setSubmitter()
    })
    this.element.addEventListener('change', (e) => {
      this.setSubmitter()
    })
    this.element.addEventListener('ajax:complete', (e) => {
      this.emitAutoSaved()
    })
    this.element.addEventListener('submit', (e) => {
      this.setIndicator()
    })
  }

  disconnect() {
    this.clearSubmitter()
  }

  setSubmitter() {
    this.clearSubmitter()
    this.submitTimer = setInterval(() => {
      this.submit()
      this.clearSubmitter()
    }, this.interval)
  }

  clearSubmitter() {
    if (this.submitTimer) {
      clearInterval(this.submitTimer)
    }
  }

  submit() {
    this.submitTarget.click()
  }

  emitAutoSaved() {
    const event = new Event('autosaved', { bubbles: true })
    this.element.dispatchEvent(event)
  }

  setSubmitInterval() {
    const interval = parseInt(this.data.get('interval'))
    if (interval) {
      this.interval = interval
    } else {
      this.interval = 1000 * 2
    }
  }

  setIndicator() {
    if (!this.hasStatusTarget) { return }

    const template = document.querySelector('#tmpl-saving')
    const element = document.importNode(template.content, true)
    this.statusTarget.innerText = ''
    this.statusTarget.appendChild(element)
  }
}
