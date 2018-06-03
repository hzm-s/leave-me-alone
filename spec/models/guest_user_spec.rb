require 'rails_helper'

describe Guest do
  describe '#own_todo_list' do
    let(:guest) { Guest.create! }
    let(:todo_list) { TodoList.new }

    it do
      guest.own_todo_list(todo_list)
      guest.save!

      aggregate_failures do
        expect(guest.todo_list_id).to_not be_nil
        expect(guest.todo_list_id).to eq(todo_list.id)
      end
    end
  end

  describe '#release_todo_list' do
    it do
      guest = register_guest

      guest.release_todo_list
      guest.save!

      expect(guest.reload.todo_list_id).to be_nil
    end
  end

  describe '#destroy' do
    it do
      guest = register_guest

      expect { guest.destroy }
        .to change { Guest.count }.by(-1)
        .and change { GuestsTodoList.count }.by(-1)
        .and change { TodoList.count }.by(0)
    end
  end

  describe '.sweep' do
    it do
      guest_a = Guest.create!(registered_at: Time.zone.parse('2018-01-23 09:59:59'))
      guest_b = Guest.create!(registered_at: Time.zone.parse('2018-01-23 10:00:00'))
      guest_c = Guest.create!(registered_at: Time.zone.parse('2018-01-23 10:00:01'))

      Guest.sweep(now: Time.zone.parse('2018-01-24 10:00:00'))

      expect(Guest.find_by(id: guest_a.id)).to be_nil
      expect(Guest.find_by(id: guest_b.id)).to_not be_nil
      expect(Guest.find_by(id: guest_c.id)).to_not be_nil
    end
  end
end
