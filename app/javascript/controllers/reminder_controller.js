import { Controller } from 'stimulus'
import Push from 'push.js'

export default class extends Controller {
  connect() {
    Push.create('Leave me alone!', {
      link: '/todo_list',
      body: 'Todoリストを確認しましょう。',
      requireInteraction: true,
      onClick: function() {
        window.focus()
        this.close()
      }
    })
  }
}
