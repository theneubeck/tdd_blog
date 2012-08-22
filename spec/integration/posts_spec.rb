describe "Writing a post", :type => :request do

  it "should write a post" do
    blog_post = FactoryGirl.create(:post, :title => "Hello World!", :body=> "My first post")
    visit "/"
    page.should have_content("Hello World!")
    page.should have_content("My first post")
  end
end

