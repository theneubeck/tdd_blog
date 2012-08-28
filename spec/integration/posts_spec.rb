require 'spec_helper.rb'

describe "Blogging", :type => :request do

  before :each do
    @post_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu orci quis nisi mollis sodales. Pellentesque euismod blandit imperdiet. Cras feugiat, nisl quis fringilla egestas, lacus enim ullamcorper dui, non placerat mauris velit non turpis. Suspendisse potenti. Donec nunc lacus, molestie lobortis pharetra ac, iaculis dapibus augue. Cras vel diam"
  end

  it "the blog should show a post" do
    # Given a blog post
    blog_post = FactoryGirl.create(:post, :title => "Hello World!", :body=> @post_text)
    # When I visit "/"
    visit "/"
    # Then I should see "Hello World!"
    page.should have_content("Hello World!")
    page.should have_content(@post_text)
  end

  it "writing a new blog post" do
    visit root_path
    click_link "New Post"
    current_path.should == new_post_path
    
    fill_in "Title", :with => "Hello again"
    fill_in "Body", :with => @post_text
    
    click_on "Create"
    
    current_path.should == root_path

    page.should have_content("Hello again")
    page.should have_content(@post_text)
  end

  it "writing a blog post with errors" do
    visit root_path
    click_link "New Post"

    fill_in "Body", :with => "My body"
    
    click_on "Create"
    
    current_path.should == posts_path

    page.should have_content("My body")

    page.should have_css('.field_with_errors', :text => "Body")
    page.should have_content("can't be blank")
    page.should have_content("is too short")
  end
  
  it "editing a blog post" do
    blog_post = FactoryGirl.create(:post, :title => "Hello World", :body=> @post_text)
    visit edit_post_path(blog_post)
    
    fill_in "Title", :with => "Ny titel"
    
    click_on "Update"
    
    page.should have_content("Ny titel")    
    current_path.should == root_path
  end

  it "editing a blog post with errors" do
    blog_post = FactoryGirl.create(:post, :title => "Hello World", :body=> @post_text)
    visit edit_post_path(blog_post)

    fill_in "Body", :with => "My body"
    click_on "Update"

    find_field("Title").value.should ==  "Hello World"
    find_field("Body").value.should include("My body")

    page.should have_content("is too short")

    current_path.should == post_path(blog_post)
  end

end

