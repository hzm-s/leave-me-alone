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
      expect(r.user).to eq(user)
    end

    it do
      expect { described_class.run(google_identity) }
        .to change { User.count }.by(1)
        .and change { UserProfile.count }.by(1)
        .and change { GoogleIdentity.count }.by(1)
    end
  end

  context 'when invalid' do
    it do
      invalid_google_identity = generate_google_identity.tap { |id| id.user_id = nil }
      expect { described_class.run(invalid_google_identity) }
        .to change { User.count }.by(0)
        .and change { UserProfile.count }.by(0)
        .and change { GoogleIdentity.count }.by(0)
    end
  end
end
