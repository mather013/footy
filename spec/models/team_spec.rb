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

      context 'when team is still in competition' do
        it 'returns true' do
          team.create_sweep_point(value: 1)

          expect(team.in_sweep?).to eq(true)
        end
      end

      context 'when team has been knocked out competition' do

        it 'returns false' do
          team.create_sweep_point(value: 0)

          expect(team.in_sweep?).to eq(false)
        end

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

  end
end
