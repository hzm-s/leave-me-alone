require 'rails_helper'

describe 'Set reminder', type: :system, js: true do
  before { sign_in(sign_up) }

  it do
    visit setting_path
    select '25', from: 'form[interval_in_minutes]'
    click_on '保存する'

    expect(page).to have_select('form[interval_in_minutes]', selected: '25')

    visit todo_list_path
    puts page.html
    expect_reminder_scheduled(25.minutes)
  end
end
