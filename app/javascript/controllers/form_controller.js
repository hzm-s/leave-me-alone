import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'field', 'submit' ]

  connect() {
    setInterval(() => {
      this.detect()
    }, 100)
  }

  detect() {
    this.scanFieldLength()
      console.log(this.canSubmit())
    if (this.canSubmit()) {
      this.enable()
    } else {
      this.disable()
    }
  }

  scanFieldLength() {
    this.fieldLength = 0
    this.fieldLength += this.fieldTarget.value.length;
  }

  enable() {
    this.submitTarget.style.visibility = 'visible'
  }

  disable() {
    this.submitTarget.style.visibility = 'hidden'
  }

  canSubmit() {
    if (this.fieldLength > 0) { return true }
    return false
  }
}
