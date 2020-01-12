class JobsController < ApplicationController
  before_action :require_login

  def index
    @jobs = Jobs.all
  end

  def perform
    if params[:job_name].include?('sync')
      class_name = "Jobs::Syncing::#{params[:job_name].camelize}".constantize
    else
      class_name = "Jobs::#{params[:job_name].camelize}".constantize
    end

    class_name.new.perform
    redirect_to jobs_url
  end

end
