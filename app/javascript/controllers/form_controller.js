import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'field', 'submit' ]

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
    this.submitTarget.style.visibility = 'visible'
    this.submitTarget.disabled = false
  }

  disable() {
    this.submitTarget.style.visibility = 'hidden'
    this.submitTarget.disabled = true
  }

  canSubmit() {
    if (this.fieldLength > 0) { return true }
    return false
  }
}
