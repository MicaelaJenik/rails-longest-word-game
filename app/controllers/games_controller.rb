require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { charset = Array('A'..'Z').sample }.join
  end

  def score
    @word = params[:word]

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    content = open(url).read
    @content_readable = JSON.parse(content)

    @separated = @word.split(%r{\s*})
    @separated.for_each do |letter|
      letter
    end

    if @word.include? @letters
      if @content_readable['found'] == true
        @result = "Congratulations! #{@word} is a valid English word"
      else
        @result = "Sorry but #{word} does not seem to be a valid English word..."
      end
    else
      @result = "Sorry but #{word} can't ve built out of #{letters}"
    end
  end
end
