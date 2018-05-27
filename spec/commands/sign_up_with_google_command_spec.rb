require 'rails_helper'

describe SignUpWithGoogleCommand do
  let(:google_identity) { generate_google_identity }

  it do
    described_class.run(google_identity)

    user = User.find_by_google_user_id(google_identity.user_id)
    todo_list = TodoList.find_by_user_id(user.id)
    aggregate_failures do
      expect(user.name).to eq(google_identity.name)
      expect(user.avatar_url).to eq(google_identity.avatar_url)
      expect(todo_list).to_not be_nil
    end
  end

  it do
    expect { described_class.run(google_identity) }
      .to change { User.count }.by(1)
      .and change { UserProfile.count }.by(1)
      .and change { GoogleIdentity.count }.by(1)
      .and change { TodoList.count }.by(1)
  end

  it do
    invalid_google_identity = generate_google_identity(user_id: '')
    expect { described_class.run(invalid_google_identity) }
      .to change { User.count }.by(1)
      .and change { UserProfile.count }.by(1)
      .and change { GoogleIdentity.count }.by(1)
      .and change { TodoList.count }.by(1)
  end
end
