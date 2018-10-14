require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'mysql2'
require 'erb'

# DB設定ファイルの読み込み
ActiveRecord::Base.configurations = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(:development)

class Datum < ActiveRecord::Base
end

get '/' do
  erb :hello
end

get '/data' do
  Datum.all.to_json
end
