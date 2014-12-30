module Jobs
  class CreateCommunicationEvent

    MESSAGE = "Don't forget to make your predictions!"

    def perform
      @week_current = Week.current

      if 12.hours.from_now > @week_current.close_date
        fixtures = @week_current.fixtures

        User.all.each do |user|
          bets = Bet.bets_for_user_and_fixtures(user, @week_current.fixtures.map(&:id))
          if bets.count != fixtures.count
            create_communication_for user
          end
        end
      end
    end

    private

    def create_communication_for user
      Communications::SmsCommunication.create(status: Communication::Status::PENDING, user_id: user.id, message: message) if ENVIRONMENT_CONFIG['toggles']['sms_communications'] && user.mobile.present?
    end

    def message
      "#{MESSAGE} #{@week_current.description} kicks off today at #{@week_current.close_date_local_time.strftime("%H:%M")}. Footy Forecast"
    end

  end
end
