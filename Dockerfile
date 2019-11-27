# Use the barebones version of Ruby 2.4.0.
FROM ruby:2.4.0-slim

# Optionally set a maintainer name to let people know who made this image.
MAINTAINER Mark Mather <mathermark@hotmail.com>

# Install dependencies:
#   - build-essential: To ensure certain gems can be compiled
#   - nodejs: Compile assets
#   - libpq-dev: Communicate with postgres through the postgres gem
#   - postgresql-client-9.4: In case you want to talk directly to postgres

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /footy

# temp start
#ENV WORKER_PROCESSES=1
#ENV LISTEN_ON=0.0.0.0:8000
#ENV DATABASE_URL=postgresql://user:password@postgres:5432/footy?encoding=utf8&pool=5&timeout=5000
#ENV E_API_URL: placeholder
#ENV E_API_KEY: placeholder
#ENV E_API_USR: placeholder
#ENV DB_USR: user
#ENV DB_PWD: password
# temp end

RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# Provide dummy data to Rails so it can pre-compile assets.
RUN bundle exec rake assets:precompile

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

# The default command that gets ran will be to start the Unicorn server.
CMD bundle exec unicorn -c config/unicorn.rb
