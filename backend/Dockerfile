FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client

WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy Gemfile first (for caching)
COPY Gemfile Gemfile.lock ./

RUN bundle install

# Copy rest of app
COPY . .

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0"]