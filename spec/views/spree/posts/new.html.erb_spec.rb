require 'rails_helper'

RSpec.describe "spree/posts/new", type: :view do
  before(:each) do
    assign(:spree_post, Spree::Post.new(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new spree_post form" do
    render

    assert_select "form[action=?][method=?]", spree_posts_path, "post" do

      assert_select "input#spree_post_title[name=?]", "spree_post[title]"

      assert_select "textarea#spree_post_content[name=?]", "spree_post[content]"
    end
  end
end
