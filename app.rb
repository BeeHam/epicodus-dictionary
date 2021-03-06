require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')
require('./lib/definitions')

get('/') do
  erb(:index)
end

get('/word_list/new') do
  erb(:word_list_form)
end

get('/word_list') do
  @words = Word.all()
  erb(:word_list)
end

post('/word_list') do
  word = params.fetch('word')
  Word.new(word).save()
  @words = Word.all()
  erb(:success)
end

get('/word_list/:word') do
  @word = Word.find(params.fetch('word'))
  erb(:definition)
end
