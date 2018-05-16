import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'showSection', 'editSection' ]

  connect() {
    this.showSectionOriginalStyle = this.showSectionTarget.style
    this.hideEditSection()
  }

  update(event) {
    event.preventDefault()
    this.hideEditSection()
    this.exposeShowSection()
  }

  open(event) {
    event.preventDefault()
    this.hideContentSection()
    this.exposeEditSection()
  }

  close(event) {
    event.preventDefault()
    this.hideEditSection()
    this.exposeShowSection()
  }

  exposeEditSection() {
    this.editSectionTarget.style.display = 'block'
  }

  exposeShowSection() {
    this.showSectionTarget.style = this.showSectionOriginalStyle
  }

  hideContentSection() {
    this.showSectionTarget.style.display = 'none'
  }

  hideEditSection() {
    this.editSectionTarget.style.display = 'none'
  }
}
