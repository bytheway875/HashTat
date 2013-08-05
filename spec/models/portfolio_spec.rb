require 'spec_helper'

describe Portfolio do
  let(:user) { mock_model(User, is_artist?: true) }

  context 'when the user is an artist' do
    it 'should create or ensure that the user has a portfolio page' do
      expect(user.portfolio).to exist
    end
  end
end