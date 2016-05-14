require 'rails_helper'

RSpec.describe Message do
  describe 'assosiations' do
    it { should belong_to :chat_room }
  end

  describe 'validations' do
    it { should validate_presence_of :user_name }
    it { should validate_presence_of :content}
    it { should validate_presence_of :chat_room }
  end

  describe '#save' do
    before :each do
      @message = Message.new(user_name: 'Ivan', content: 'Some text')
    end
    
    context 'without chat room' do
      it 'doesn\'t save in DB ' do
        expect(@message.save).to equal false
      end
    end

    context 'with chat room' do
      subject(:message) do
        @message.create_chat_room(name: 'TestRoom')
      end

      it 'save in DB' do
        expect(message.save).to equal true
      end
    end
  end
end