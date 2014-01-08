require 'spec_helper'

describe "profiles/show" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :research => "Research",
      :current_students => "Current Students",
      :collaborators => "Collaborators",
      :journals => "Journals",
      :conferences => "Conferences",
      :books => "Books",
      :monogram => "Monogram",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Research/)
    rendered.should match(/Current Students/)
    rendered.should match(/Collaborators/)
    rendered.should match(/Journals/)
    rendered.should match(/Conferences/)
    rendered.should match(/Books/)
    rendered.should match(/Monogram/)
    rendered.should match(/1/)
  end
end
