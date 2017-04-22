FROM ruby:2.3.3-alpine
COPY script.rb .
CMD [ "ruby", "sleep.rb"]
