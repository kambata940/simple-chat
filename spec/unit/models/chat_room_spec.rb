require 'rails_helper'

RSpec.describe ChatRoom do

  describe 'assosiations' do
    it { should have_many :messages }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe '#destroy' do
    before(:each) { ChatRoom.create(name: 'DoomedChatRoom') }

    let(:chat_room) { ChatRoom.find_by(name: 'DoomedChatRoom') }

    context 'when does\'t have messages' do
      it 'deletes the object' do
        id = chat_room.destroy.id
        expect{ChatRoom.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when have messages' do
      before do
        chat_room.messages.build(user_name: 'Ivan', content: 'testcontent1')
        chat_room.messages.build(user_name: 'Not Ivan', content: 'testcontent2')
      end

      it 'deletes the messages' do
        messages = chat_room.messages
        expect(messages.size).to equal 2
        chat_room.destroy
        expect(messages.size).to equal 0
      end
    end
  end
end