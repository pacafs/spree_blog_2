require 'rails_helper'

RSpec.describe "spree/posts/show", type: :view do
  before(:each) do
    @spree_post = assign(:spree_post, Spree::Post.create!(
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
