require 'rails_helper'

describe SignUpWithGoogleCommand do
  let(:google_identity) { generate_google_identity }

  context 'when valid' do
    it do
      r = described_class.run(google_identity)
      expect(r).to be_succeeded
    end

    it do
      r = described_class.run(google_identity)

      user = User.find_by_google_user_id(google_identity.user_id)
      aggregate_failures do
        expect(r.user).to eq(user)
        expect(user.name).to eq(google_identity.name)
        expect(user.avatar_url).to eq(google_identity.avatar_url)
      end
    end

    it do
      r = described_class.run(google_identity)

      todo_list = TodoList.find_by_user_id(r.user.id)
      expect(todo_list).to_not be_nil
    end

    it do
      expect { described_class.run(google_identity) }
        .to change { User.count }.by(1)
        .and change { UserProfile.count }.by(1)
        .and change { GoogleIdentity.count }.by(1)
        .and change { TodoList.count }.by(1)
        .and change { UsersTodoList.count }.by(1)
    end
  end

  context 'when invalid' do
    it do
      invalid_google_identity = generate_google_identity.tap { |id| id.user_id = nil }
      expect { described_class.run(invalid_google_identity) }
        .to change { User.count }.by(0)
        .and change { UserProfile.count }.by(0)
        .and change { GoogleIdentity.count }.by(0)
        .and change { TodoList.count }.by(0)
        .and change { UsersTodoList.count }.by(0)
    end
  end
end
