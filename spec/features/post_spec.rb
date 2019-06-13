require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Fname", last_name: "Lname")
    login_as(@user, :scope => :user)
  end
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.new(date: Date.today, rationale: "Rationale1")
      post1.user_id = @user.id
      post1.save
      post2 = Post.new(date: Date.today, rationale: "Rationale2")
      post2.user_id = @user.id
      post2.save
      visit posts_path
      expect(page).to have_content(/Rationale1|Rationale2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"

      expect(page). to have_content("Some rationale")
    end

    it 'will have a user associated with post' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
