require 'rails_helper'

RSpec.describe "spree/posts/edit", type: :view do
  before(:each) do
    @spree_post = assign(:spree_post, Spree::Post.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit spree_post form" do
    render

    assert_select "form[action=?][method=?]", spree_post_path(@spree_post), "post" do

      assert_select "input#spree_post_title[name=?]", "spree_post[title]"

      assert_select "textarea#spree_post_content[name=?]", "spree_post[content]"
    end
  end
end
