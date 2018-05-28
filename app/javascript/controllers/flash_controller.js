import { Controller } from 'stimulus'

export default class extends Controller {
  connect() {
    const timeout = parseInt(this.data.get('timeout'))
    setTimeout(() => {
      this.element.querySelector('a[data-dismiss]').click()
    }, timeout)
  }
}
