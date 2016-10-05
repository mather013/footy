class JobsController < ApplicationController
  before_filter :require_login

  def index
    @jobs = Jobs.all
  end

  def perform
    class_name = "Jobs::#{params[:job_name].camelize}".constantize
    class_name.new.perform
    redirect_to jobs_url
  end

end
