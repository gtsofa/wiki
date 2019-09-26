require 'sinatra'
require 'uri'

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return nill
end
def save_content(title, content)
  File.open("pages/#{title}.txt", "w") do |file|
    file.print(content)
  end
end

get '/' do
  erb :welcome
end

get '/new' do
  erb :new
end


get '/:title' do
  @title = params[:title]
  @content = page_content(@title)
  erb :show
end

get '/:title/edit' do
  @title = params[:title]
  @content = page_content(@title)
  erb :edit
end
post '/create' do
  #params.inspect
  save_content(params["title"], params["content"])
  redirect URI.escape("/#{params["title"]}")
end

get '/pages/:id/edit' do
  @page = pages.find(params[:id])
  erb :'pages/edit'
end

