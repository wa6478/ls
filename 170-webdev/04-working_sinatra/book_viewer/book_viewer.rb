require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(chapter)
    chapter.split(/\n\n/).map.with_index do |para, idx| 
      "<p id=paragraph#{idx}>#{para}</p>"
    end.join
  end

  def emphasize(word, string)
    string.gsub(word, "<strong>#{word}</strong>")
  end
end

get "/" do
  @title = "The Adventures of Sherlock Holmes tho"

  erb :home 
end

get "/chapter/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{params[:number]}.txt")

  erb :chapter
end

get "/show/:name" do
  params[:name]
end

def each_chapter(&block)
  @contents.each.with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

def chapters_matching(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    matches = {}
    contents.split("\n\n").each_with_index do |para, idx|
      matches[idx] = para if para.include?(query)
    end
    results << {number: number, name: name, paragraphs: matches} if matches.any?
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

not_found do
  redirect "/"
end