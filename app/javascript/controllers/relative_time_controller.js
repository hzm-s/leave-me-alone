import { Controller } from 'stimulus'
import moment from 'moment'

export default class extends Controller {
  initialize() {
    moment.locale('ja')
  }

  connect() {
    this.suffix = this.element.innerText;
    this.update()
    this.updateTimer = setInterval(() => { this.update() }, 1000 * 60)
  }

  disconnect() {
    if (this.updateTimer) {
      clearInterval(this.updateTimer)
    }
  }

  update() {
    const absoluteTime = this.data.get('time')
    const relativeTime = this.convertToRelativeTime(absoluteTime)
    const suffix = this.data.get('suffix')
    this.element.innerText = `${relativeTime}${suffix}`
  }

  convertToRelativeTime(absoluteTime) {
    return moment(absoluteTime, 'YYYY/MM/DD hh:mm:ss').fromNow()
  }
}
