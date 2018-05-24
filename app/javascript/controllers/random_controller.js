import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['subject']

  initialize() {
    const index = Math.floor(Math.random() * this.subjectTargets.length)
    this.show(index)
  }

  show(index) {
    this.subjectTargets.forEach((el, i) => {
      el.classList.toggle('mk-Copy_Image-current', index == i)
    })
  }
}
