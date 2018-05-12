import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'primary', 'form', 'input' ]

  connect() {
    this.formTarget.style.display = 'none'
  }

  open(event) {
    event.preventDefault();

    this.primaryTarget.style.display = 'none'
    this.formTarget.style.display = 'block'
    this.inputTarget.focus();
  }

  close(event) {
    event.preventDefault();

    this.formTarget.style.display = 'none'
    this.primaryTarget.style.display = this.data.get('primary-display')
  }
}
