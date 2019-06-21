require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:employee)
    login_as(@user, :scope => :user)
  end
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(current_path).to eq(posts_path)
    end

    it 'cannot be reached by guests' do
      logout(:user)
      visit posts_path
      expect(current_path).to eq(new_user_session_path)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      FactoryGirl.build_stubbed(:post)
      FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end

    it 'only shows posts created by oneself' do
      FactoryGirl.create(:post)
      other_post = FactoryGirl.create(:post_from_other_user)
      other_user = User.find(other_post.user_id)

      login_as(other_user, :scope => :user)

      visit posts_path
      expect(page).to have_content(/Unseen/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
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
      fill_in 'post[overtime_request]', with: 4.5
      expect { click_on "Save" }.to change(Post, :count).by(1)
    end

    it 'will have a user associated with post' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      fill_in 'post[overtime_request]', with: 4.5
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe "edit" do
    before do
      @post = FactoryGirl.create(:post)
      @edit_user = User.find(@post.user_id)
      login_as(@edit_user, :scope => :user)
    end
    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited Content"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("Edited Content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end

  describe "delete" do
    before do
      @post = FactoryGirl.create(:post)
      user = User.find(@post.user_id)
      login_as(user, :scope => :user)
    end

    it 'can be deleted' do
      visit posts_path
      click_link("delete_post_from_index_#{@post.id}")
    end
  end
end
