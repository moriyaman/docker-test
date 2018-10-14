FROM ruby:2.3
LABEL maintainer 'moriyaman'

#ENV LANG C.UTF-8
#RUN groupadd -r moriyaman && useradd -r -g moriyaman moriyaman
#RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

WORKDIR /usr/src/app
RUN mkdir /usr/src/app/views
RUN mkdir /usr/src/app/config

COPY Gemfile Gemfile.lock /usr/src/app/
COPY views/hello.erb /usr/src/app/views/
COPY config/database.yml /usr/src/app/config
COPY app.rb /usr/src/app/
RUN bundle install

EXPOSE 80
CMD ["bundle", "exec", "ruby", "/usr/src/app/app.rb", "-o", "0.0.0.0", "-p", "80"]
