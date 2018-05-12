import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'field' ]

  connect() {
    this.disable()
    this.startDetection()
  }

  startDetection() {
    this.detectTimer = setInterval(() => { this.detect() }, 100)
  }

  stopDetection() {
    if (this.detectTimer) {
      clearInterval(this.detectTimer)
    }
  }

  detect() {
    this.scanFieldLength()
    if (this.canSubmit()) {
      this.enable()
    } else {
      this.disable()
    }
  }

  scanFieldLength() {
    this.fieldLength = 0
    this.fieldTargets.forEach((el) => {
      this.fieldLength += el.value.length;
    })
  }

  enable() {
    this.submitElement.style.visibility = 'visible'
    this.submitElement.disabled = false
  }

  disable() {
    this.submitElement.style.visibility = 'hidden'
    this.submitElement.disabled = true
  }

  canSubmit() {
    if (this.fieldLength > 0) { return true }
    return false
  }

  get submitElement() {
    return this.element.querySelectorAll('button[type="submit"], input[type="submit"]')[0]
  }
}
