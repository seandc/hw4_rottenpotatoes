require 'spec_helper'

describe MoviesController do
  before(:each) do
    @movie = Movie.create(:title => "Good Movie", :director => "Bob")
  end
  describe "GET edit" do 

    it "should make the movie with given id available to the the view" do
      get :edit, :id => @movie.id
      assigns(:movie).should == @movie
    end

    it "should render the movie edit view" do 
      get :edit, :id => @movie.id
      expect(response).to render_template('edit')
    end

  end

  describe "PUT update" do 
    it "should update the movie with given parameters" do
      put :update, :id => @movie.id, :movie => {:director => "Sam"}
      @movie.reload
      @movie.director.should == "Sam"
    end
  end
end