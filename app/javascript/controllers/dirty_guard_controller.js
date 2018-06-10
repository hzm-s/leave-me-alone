import { Controller } from 'stimulus'

export default class extends Controller {
  initialize() {
    this.isDirty = false

    this.element.addEventListener('formchanged', (e) => {
      this.isDirty = true
    })
    this.element.addEventListener('change', (e) => {
      this.isDirty = true
    })
    this.element.addEventListener('autosaved', (e) => {
      this.isDirty = false
    })
    window.addEventListener('beforeunload', (e) => {
      return this.confirmLeave(e)
    })
  }

  confirmLeave(e) {
    if (this.isDirty) {
      const message = '変更内容が保存されていません。'
      e.returnValue = message
      return message
    }
  }
}
