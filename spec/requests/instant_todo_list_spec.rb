require 'rails_helper'

describe 'InstantTodoList' do
  let(:google_identity) { mock_google_sign_in_identity }

  it do
    get instant_todo_list_path
    guest_id_a = cookies[:guest_id]

    get instant_todo_list_path
    guest_id_b = cookies[:guest_id]

    expect(guest_id_a).to_not eq(guest_id_b)
  end

  it do
    get instant_todo_list_path
    patch instant_todo_list_path, params: { form: { title: 'Yarukoto' } }, xhr: true
    post google_sign_up_path, params: { google_id_token: google_identity.token }, xhr: true
    follow_turbolinks_visit!

    expect(response.body).to include('Yarukoto')
  end
end
