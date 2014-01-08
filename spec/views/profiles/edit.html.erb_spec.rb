require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :research => "MyString",
      :current_students => "MyString",
      :collaborators => "MyString",
      :journals => "MyString",
      :conferences => "MyString",
      :books => "MyString",
      :monogram => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path(@profile), :method => "post" do
      assert_select "input#profile_research", :name => "profile[research]"
      assert_select "input#profile_current_students", :name => "profile[current_students]"
      assert_select "input#profile_collaborators", :name => "profile[collaborators]"
      assert_select "input#profile_journals", :name => "profile[journals]"
      assert_select "input#profile_conferences", :name => "profile[conferences]"
      assert_select "input#profile_books", :name => "profile[books]"
      assert_select "input#profile_monogram", :name => "profile[monogram]"
      assert_select "input#profile_user_id", :name => "profile[user_id]"
    end
  end
end
