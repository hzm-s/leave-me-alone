require 'rails_helper'

describe SignUpWithGoogleCommand do
  let(:valid) do
    {
      google_user_id: '1234567890',
      name: 'User Name',
      avatar_url: 'http://avatar.url'
    }
  end

  it do
    described_class.run(valid)

    user = User.find_by_google_user_id(valid[:google_user_id])
    aggregate_failures do
      expect(user.name).to eq(valid[:name])
      expect(user.avatar_url).to eq(valid[:avatar_url])
    end
  end

  it do
    expect { described_class.run(valid) }
      .to change { User.count }.by(1)
      .and change { UserProfile.count }.by(1)
      .and change { GoogleIdentity.count }.by(1)
  end
end
