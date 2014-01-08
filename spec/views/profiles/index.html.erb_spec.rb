require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :research => "Research",
        :current_students => "Current Students",
        :collaborators => "Collaborators",
        :journals => "Journals",
        :conferences => "Conferences",
        :books => "Books",
        :monogram => "Monogram",
        :user_id => 1
      ),
      stub_model(Profile,
        :research => "Research",
        :current_students => "Current Students",
        :collaborators => "Collaborators",
        :journals => "Journals",
        :conferences => "Conferences",
        :books => "Books",
        :monogram => "Monogram",
        :user_id => 1
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Research".to_s, :count => 2
    assert_select "tr>td", :text => "Current Students".to_s, :count => 2
    assert_select "tr>td", :text => "Collaborators".to_s, :count => 2
    assert_select "tr>td", :text => "Journals".to_s, :count => 2
    assert_select "tr>td", :text => "Conferences".to_s, :count => 2
    assert_select "tr>td", :text => "Books".to_s, :count => 2
    assert_select "tr>td", :text => "Monogram".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
