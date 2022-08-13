require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'test name', photo: 'test photo', bio: 'test bio', post_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'photo should be present' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'bio should be present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should not be a negative number' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post_counter should be a number greater than or equal to zero' do
    subject.post_counter = nil
    expect(subject).to_not be_valid
  end
end
