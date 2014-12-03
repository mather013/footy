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


  describe 'class methods' do

    describe 'all_for_choices' do

      before :each do
        Team.create(id: 1, name: 'argentina', abbreviation: 'arg')
        Team.create(id: 2, name: 'brazil',    abbreviation: 'bra')
        Team.create(id: 3, name: 'colombia',  abbreviation: 'col')
        Team.create(id: 4, name: 'denmark',   abbreviation: 'den')
      end

      it 'returns array of team name and id for all teams' do
        expect(Team.all_for_choices).to eq [["argentina", 1], ["brazil", 2], ["colombia", 3], ["denmark", 4]]
      end

    end
  end
end
