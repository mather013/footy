require 'spec_helper'

module Jobs
  describe CreateCommunicationEvent do
    let(:fixtures) { [double(Fixture, id: 1), double(Fixture, id: 2), double(Fixture, id: 3)] }
    let(:users) { [double(User, id: 99, mobile: mobile_number, bets: bets)] }

    describe 'instance methods' do

      describe '#perform' do

        before :each do
          User.create(name: 'Mr Test', username: 'tester', password: 'abc', mobile: '123456789')
          Week.stub(:current).and_return(current_week)
          User.stub(:all).and_return(users)
          Bet.stub(:bets_for_user_and_fixtures).and_return(bets)

          Jobs::CreateCommunicationEvent.new.perform
        end

        context 'when it is less than 12 hours until kick off of week' do
          let(:close_date) { 6.hours.from_now }
          let(:current_week) { double(Week, description: 'Week 08', close_date: close_date, fixtures: fixtures) }

          context 'when user has insufficient bets for week' do
            let(:bets) { [double(Bet)] }

            context 'and the user does not have a mobile number' do
              let(:mobile_number) { nil }

              it 'does not create a pending sms communication record' do
                expect(Communications::SmsCommunication.count).to eq(0)
              end
            end

            context 'and the user has a mobile number' do
              let(:mobile_number) { '123456789' }
              let(:expected_message) { "Don't forget to make your predictions! Week 08 kicks off today at #{close_date.utc.getlocal.strftime("%H:%M")}. Footy Forecast" }

              it 'creates a pending sms communication record' do
                expect(Communications::SmsCommunication.count).to eq(1)
              end

              it 'creates a pending sms communication record with expected attributes' do
                expect(Communications::SmsCommunication.first.user_id).to eq(99)
                expect(Communications::SmsCommunication.first.message).to eq(expected_message)
              end
            end
          end

          context 'when user has sufficient bets for week' do
            let(:mobile_number) { '123456789' }
            let(:bets) { [double(Bet), double(Bet), double(Bet)] }

            it 'does not create a pending sms communication record' do
              expect(Communications::SmsCommunication.count).to eq(0)
            end
          end
        end

        context 'when it is more than 12 hours until kick off of week' do
          let(:close_date) { 13.hours.from_now }
          let(:current_week) { double(Week, description: 'Week 08', close_date: close_date, fixtures: fixtures) }
          let(:mobile_number) { '123456789' }
          let(:bets) { [double(Bet), double(Bet)] }

          it 'does not create a sms communication record' do
            expect(Communications::SmsCommunication.count).to eq(0)
          end
        end
      end
    end
  end
end
