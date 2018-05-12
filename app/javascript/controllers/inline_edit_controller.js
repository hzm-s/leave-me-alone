import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'primary', 'form' ]

  connect() {
    this.hideForm()
  }

  open(event) {
    event.preventDefault()
    this.backup()
    this.openForm()
  }

  close(event) {
    event.preventDefault()
    this.closeForm()
    this.restore()
  }

  hideForm() {
    this.formTarget.style.display = 'none'
  }

  backup() {
    this.value = this.inputElement.value
  }

  restore() {
    this.inputElement.value = this.value
  }

  openForm() {
    this.primaryTarget.style.display = 'none'
    this.formTarget.style.display = 'block'
    this.inputElement.select()
  }

  closeForm() {
    this.formTarget.style.display = 'none'
    this.primaryTarget.style.display = this.data.get('primary-display')
  }

  get inputElement() {
    return this.formTarget.querySelector('input')
  }
}
