require 'rails_helper'

describe 'InstantTodoList' do
  it do
    get instant_todo_list_path
    guest_id_a = cookies[:guest_id]

    get instant_todo_list_path
    guest_id_b = cookies[:guest_id]

    expect(guest_id_a).to_not eq(guest_id_b)
  end

  it do
    get instant_todo_list_path
    expect(response.body).to include('ユーザー登録')
  end
end
