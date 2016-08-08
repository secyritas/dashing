FROM            ubuntu:14.04
MAINTAINER      Niklas Tanskanen "niklas.tanskanen@procountor.com"

# Add and update apt sources
RUN apt-get update; apt-get -y upgrade

# Add compiler package and ruby1.9.1
RUN apt-get install -y build-essential
RUN apt-get install -y ruby1.9.1-dev
RUN apt-get install -y nodejs

# Create dir
RUN mkdir /dashing/

# Copy dashing
COPY . /opt/

# Build dashing
RUN cd /opt/dashing && gem build /opt/dashing/dashing.gemspec

# Install dashing
RUN gem install /opt/dashing/dashing-1.3.6.gem

# Install bundle
RUN gem install bundle
