require 'spec_helper'

describe "posts/new" do

  it "should render a form" do
    @post = Post.new 
    render

    rendered.should have_content("Title")
    rendered.should have_content("Body")
    rendered.should have_button("Create")
  end

  it "should render a prefilled form" do
    @post = FactoryGirl.build(:post)
    render

    rendered.should have_content(@post.title)
    rendered.should have_content(@post.body)
    rendered.should have_button("Create")
  end

  it "should render an error messagse" do
    @post = FactoryGirl.build(:post, :title => nil, :body => "B")
    @post.valid?
    render

    rendered.should have_content("Titlecan't be blank")
  end

end
