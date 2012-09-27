require 'spec_helper'

describe "posts/index" do

  it "should view a title and a text" do
    @posts = [FactoryGirl.create(:post, :title => "title" , :body => "body" * 50)]
    render

    rendered.should have_content("title")
    rendered.should have_content("body" * 50)
  end

end
