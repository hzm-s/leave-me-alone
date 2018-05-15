import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'content', 'contentSection', 'editSection' ]

  connect() {
    this.contentSectionOrigin = {
      style: this.contentSectionTarget.style
    }
    this.hideEditSection()
  }

  update() {
  }

  open(event) {
    event.preventDefault()
    this.hideContentSection()
    this.showEditSection()
  }

  close(event) {
    event.preventDefault()
    this.hideEditSection()
    this.showContentSection()
  }

  showEditSection() {
    this.editSectionTarget.style.display = 'block'
    this.inputElement.value = this.contentValue
    this.inputElement.select()
  }

  showContentSection() {
    this.contentSectionTarget.style = this.contentSectionOrigin.style
  }

  hideContentSection() {
    this.contentSectionTarget.style.display = 'none'
  }

  hideEditSection() {
    this.editSectionTarget.style.display = 'none'
  }

  get contentValue() {
    return this.contentTarget.innerText
  }

  get inputElement() {
    return this.editSectionTarget.querySelector('input')
  }
}
