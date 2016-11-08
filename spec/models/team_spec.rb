require 'spec_helper'

describe Team do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:name) }
    it { should respond_to(:abbreviation) }
    it { should respond_to(:external_id) }
  end

  describe 'mass assignment' do
    [:id, :name, :abbreviation, :external_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'associations' do
    it { should have_one :standing }
    it { should have_many :players }
    it { should have_many :events }
    it { should have_one :sweep_point }
    it { should have_one :gb_point }
  end

  describe 'scopes' do
    before :each do
      ['Colombia', 'TBA', 'Argentina', 'Brazil'].each { |team_name| Team.create(name: team_name) }
    end

    describe 'sorted' do
      let(:expected_result) { ['Argentina', 'Brazil', 'Colombia'] }

      it 'returns ordered by team' do
        expect(Team.sorted.collect(&:name)).to eq(expected_result)
      end
    end
  end

  describe 'instance methods' do
    describe 'in_sweep?' do
      let(:team) { Team.create(name: 'Argentina', abbreviation: 'arg') }

      before :each do
        Week.stub(:count).and_return(7)
      end

      context 'when team is still in competition' do
        it 'returns true' do
          team.create_sweep_point(value: 8)

          expect(team.in_sweep?).to eq(true)
        end
      end

      context 'when team has been knocked out competition' do
        it 'returns false' do
          team.create_sweep_point(value: 6)

          expect(team.in_sweep?).to eq(false)
        end
      end

      context 'when a team is not in sweep at all' do
        it 'returns false' do
          expect(team.in_sweep?).to eq(false)
        end
      end
    end

    describe 'fixtures' do
      xit '' do

      end
    end

    describe 'fixtures_from' do
      xit '' do

      end
    end

    describe 'calc_form' do
      xit '' do

      end
    end

    describe 'form_fixtures' do
      xit '' do

      end
    end

    describe 'home_results' do
      xit '' do

      end
    end

    describe 'away_results' do
      xit '' do

      end
    end

    describe 'results' do
      xit '' do

      end
    end

    describe 'calc_form' do
      xit '' do

      end
    end

    describe 'form' do
      xit '' do

      end
    end

    describe 'league_stats' do
      xit '' do

      end
    end

    describe 'goals' do
      xit '' do

      end
    end

  end
end
