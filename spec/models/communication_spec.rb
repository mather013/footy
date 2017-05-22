require 'spec_helper'

describe Communication do

  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'scopes' do
    let!(:comm_one)   { Communications::SmsCommunication.create(status: Communication::Status::PENDING, user_id: 1, message: 'comm one') }
    let!(:comm_two)   { Communications::SmsCommunication.create(status: Communication::Status::FAILED, user_id: 2, message: 'comm two') }
    let!(:comm_three) { Communications::EmailCommunication.create(status: Communication::Status::PENDING, user_id: 1, message: 'comm three') }
    let!(:comm_four)  { Communications::EmailCommunication.create(status: Communication::Status::SENT, user_id: 2, message: 'comm four') }

    let(:expected_sql) { "SELECT \"communications\".* FROM \"communications\" WHERE \"communications\".\"type\" IN ('Communications::SmsCommunication') AND \"communications\".\"status\" = 'pending'" }

    it 'returns only pending sms' do
      expect(Communications::SmsCommunication.pending).to eq [comm_one]
    end

    it 'executes expected sql' do
      expect(Communications::SmsCommunication.pending.to_sql).to eq expected_sql
    end
  end

  describe 'instance methods' do

    describe '#mark_sent' do
      let!(:communication) { Communications::SmsCommunication.create(status: Communication::Status::PENDING, user_id: 1, message: 'comm one') }

      it 'returns status sent' do
        communication.mark_sent
        expect(communication.status).to eq(Communication::Status::SENT)
      end
    end

    describe '#mark_failed' do
      let!(:communication) { Communications::SmsCommunication.create(status: Communication::Status::PENDING, user_id: 1, message: 'comm one') }

      it 'returns status failed' do
        communication.mark_failed
        expect(communication.status).to eq(Communication::Status::FAILED)
      end
    end

    describe '#to_hash' do
      let!(:communication) { Communications::SmsCommunication.create(status: Communication::Status::PENDING, user_id: 1, message: 'hello test sms') }
      let!(:user) { User.create(id: 1, name: 'Mark Mather', username: 'markm', password: 'abc', mobile: '123') }

      it 'returns expected values' do
        expect(communication.to_hash['mobile']).to eq('123')
        expect(communication.to_hash['message']).to eq('hello test sms')
      end

    end
  end
end
