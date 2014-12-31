require 'spec_helper'

module Feed
  describe Team do
    let(:team) { Feed::Team.new(hash) }
    let(:hash) { { :stand_id             => "12049249",
                   :stand_competition_id => "1204",
                   :stand_season         => "2014/2015",
                   :stand_round          => "19",
                   :stand_stage_id       => "12041081",
                   :stand_group          => "",
                   :stand_country        => "England",
                   :stand_team_id        => "9249",
                   :stand_team_name      => "Liverpool",
                   :stand_status         => "up",
                   :stand_recent_form    => "WWDLD",
                   :stand_position       => "8",
                   :stand_overall_gp     => "19",
                   :stand_overall_w      => "8",
                   :stand_overall_d      => "4",
                   :stand_overall_l      => "7",
                   :stand_overall_gs     => "26",
                   :stand_overall_ga     => "25",
                   :stand_home_gp        => "10",
                   :stand_home_w         => "4",
                   :stand_home_d         => "4",
                   :stand_home_l         => "2",
                   :stand_home_gs        => "13",
                   :stand_home_ga        => "9",
                   :stand_away_gp        => "9",
                   :stand_away_w         => "4",
                   :stand_away_d         => "4",
                   :stand_away_l         => "2",
                   :stand_away_gs        => "13",
                   :stand_away_ga        => "9",
                   :stand_gd             => "1",
                   :stand_points         => "28",
                   :stand_desc           => "None" } }

    describe 'attributes' do
      it 'has the expected values' do
        expect(team.id).to eq(9249)
        expect(team.position).to eq(8)
        expect(team.points).to eq(28)
        expect(team.form).to eq('WWDLD')
        expect(team.name).to eq('Liverpool')
        expect(team.form_score).to eq(8)
      end
    end

  end
end
