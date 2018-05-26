import { Controller } from 'stimulus'
import moment from 'moment'
import Push from 'push.js'

export default class extends Controller {
  static targets = ['subject']

  initialize() {
    this.setReminder()

    this.subjectTarget.addEventListener('formchanged', (e) => {
      this.setReminder()
    })
    this.subjectTarget.addEventListener('change', (e) => {
      this.setReminder()
    })
  }

  disconnect() {
    this.clearReminder()
  }

  setReminder() {
    const after = 1000 * 60 * 30
    this.clearReminder()
    this.remindTimer = setInterval(() => {
      this.remind()
      this.clearReminder()
    }, after)
    this.data.set('at', moment().add(after, 'ms').format())
  }

  clearReminder() {
    if (this.remindTimer) {
      clearInterval(this.remindTimer)
    }
  }

  remind() {
    const controller = this
    Push.create('Leave me alone!', {
      link: '/todo_list',
      body: 'Todoリストを確認しましょう。',
      requireInteraction: true,
      onClick: function() {
        window.focus()
        this.close()
        controller.setReminder()
      }
    })
  }
}
