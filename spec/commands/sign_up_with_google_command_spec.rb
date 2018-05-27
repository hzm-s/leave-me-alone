require 'rails_helper'

describe SignUpWithGoogleCommand do
  let(:google_identity) { generate_google_identity }

  it do
    described_class.run(google_identity)

    user = User.find_by_google_user_id(google_identity.user_id)
    aggregate_failures do
      expect(user.name).to eq(google_identity.name)
      expect(user.avatar_url).to eq(google_identity.avatar_url)
    end
  end

  it do
    expect { described_class.run(google_identity) }
      .to change { User.count }.by(1)
      .and change { UserProfile.count }.by(1)
      .and change { GoogleIdentity.count }.by(1)
  end
end
