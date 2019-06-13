require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @post = Post.create(date: Date.today, rationale: "Anything")
      user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Fname", last_name: "Lname")
      login_as(user, :scope => :user)
      @post.user_id = user.id
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date and rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
