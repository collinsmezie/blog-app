require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'text') }

  before { subject.save }

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
