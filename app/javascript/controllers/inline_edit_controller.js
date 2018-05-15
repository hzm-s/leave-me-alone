import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'content', 'contentSection', 'editSection' ]

  initialize() {
    const value = this.data.get('value')
    this.renderContent()
  }

  connect() {
    this.contentSectionOriginalStyle = this.contentSectionTarget.style
    this.hideEditSection()
  }

  renderContent() {
    const value = this.data.get('value')
    this.contentTarget.innerText = value
  }

  update(event) {
    event.preventDefault()
    const newValue = this.inputElement.value
    this.data.set('value', newValue)
    this.renderContent()
    this.hideEditSection()
    this.showContentSection()
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
    this.contentSectionTarget.style = this.contentSectionOriginalStyle
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
