require 'rails_helper'

RSpec.describe "spree/posts/index", type: :view do
  before(:each) do
    assign(:spree_posts, [
      Spree::Post.create!(
        :title => "Title",
        :content => "MyText"
      ),
      Spree::Post.create!(
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of spree/posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
