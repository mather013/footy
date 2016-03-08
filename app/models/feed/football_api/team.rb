module Feed
  module FootballApi
    class Team

      attr_accessor :id, :form, :form_score, :points, :position, :name, :played, :goals

      def initialize(hash)
        @id = hash[:stand_team_id].to_i
        @name = hash[:stand_team_name]
        @form = hash[:stand_recent_form].reverse
        @form_score = calculate_form_score @form
        @points = hash[:stand_points].to_i
        @position = hash[:stand_position].to_i
        @played = hash[:stand_overall_gp].to_i
        @goals = { for: hash[:stand_overall_gs].to_i,
                   against: hash[:stand_overall_ga].to_i,
                   difference: hash[:stand_gd].to_i }
      end

      private

      def calculate_form_score form
        score = 0
        form.split('').each do |i|
          i == 'W' ? score+=3 : (score+=1 if i == 'D')
        end
        score
      end

    end
  end
end
