require 'spec_helper'

describe Thing do
  describe 'New Things' do
    it 'creates new things with valid params' do
      thing = build(:thing)
      expect(thing).to be_valid
    end

    it 'does not create duplicate things (name)' do
      thing1 = create(:thing)
      thing2 = build(:thing, name: thing1.name)
      expect(thing1).to be_valid
      expect(thing2).not_to be_valid
    end
  end
end
