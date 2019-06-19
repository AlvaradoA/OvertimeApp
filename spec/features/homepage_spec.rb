require 'rails_helper'

describe 'Homepage' do
  before do
    @post = FactoryGirl.create(:post)
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
    visit root_path
  end
  it 'allows the admin to approve posts via the homepage' do
    click_on("approve_#{@post.id}")

    expect(@post.reload.status).to eq('approved')
  end

  it 'allows the admin to reject posts via the homepage' do
    click_on("reject_#{@post.id}")

    expect(@post.reload.status).to eq('rejected')
  end

  it 'does not allow users to approve/reject posts' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit approve_post_path(@post)
    expect(@post.reload.status).to_not eq('approved')
    visit reject_post_path(@post)
    expect(@post.reload.status).to_not eq('rejected')
  end
end
