require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'post title', text: 'post text', comment_counter: 0, like_counter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too short' do
    subject.title = 'x'
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 30
    expect(subject).to_not be_valid
  end

  it 'comment_countershould be a number greater than or equal to zero' do
    subject.comment_counter = nil
    expect(subject).to_not be_valid
  end

  it 'like_counter should be a number greater than or equal to zero' do
    subject.like_counter = nil
    expect(subject).to_not be_valid
  end
end
