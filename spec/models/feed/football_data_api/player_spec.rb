require 'spec_helper'

module Feed
  module FootballDataApi

    describe Player do
      let(:player) { Feed::FootballDataApi::Player.new(hash) }

      let(:hash) { {:position => 'Keeper',
                    :name => 'Simon Mignolet',
                    :jerseyNumber => '22',
                    :dateOfBirth => '1988-03-06',
                    :nationality => 'Belgium',
                    :contractUntil => '2021-06-30',
                    :marketValue => nil} }

      describe 'attributes' do
        it 'has the expected values' do
          expect(player.position).to eq('GK')
          expect(player.surname).to eq('Mignolet')
          expect(player.forename).to eq('Simon')
          expect(player.dob).to eq(Date.parse('1988-03-06'))
          expect(player.squad_number).to eq(22)
          expect(player.nationality).to eq('Belgium')
        end
      end

    end
  end
end
