describe "Blogging", :type => :request do

  context "the blog" do

    it "should show a post" do
      # Given a blog post
      blog_post = FactoryGirl.create(:post, :title => "Hello World!", :body=> "My first post")
      # When I visit "/"
      visit "/"
      # Then I should see "Hello World!"
      page.should have_content("Hello World!")
      page.should have_content("My first post")
    end
    
  end
end

