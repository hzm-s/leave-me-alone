import { Controller } from 'stimulus'

export default class extends Controller {
  connect() {
    //this.submitTimer = setInterval(() => { this.element.submit() }, 1000 * 5)
  }

  disconnect() {
    if (this.submitTimer) {
      clearInterval(this.submitTimer)
    }
  }
}
