require 'sinatra'
require './haigacat'

get '/' do
  Haigacat.decode("123m456s789p").to_s
end
