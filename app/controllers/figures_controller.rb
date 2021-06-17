class FiguresController < ApplicationController
  # add controller methods
  
  get '/figures/new' do
    erb :'/figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])

    if !params["figure"]["title_ids"].nil?
      @figure.title_ids = params["figure"]["title_ids"]
    end
    
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    
    redirect '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'/figures/edit'
  end
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
end
