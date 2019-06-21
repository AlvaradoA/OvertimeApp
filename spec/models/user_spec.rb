require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe "creation" do

    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "validation" do
    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only contain integers' do
      @user.phone = "mygreatstr"
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only have 10 chars' do
      @user.phone = "12345678901"
      expect(@user).to_not be_valid
      @user.phone = "123456789"
      expect(@user).to_not be_valid
    end

    it 'requires the ssn attr' do
      @user.ssn = nil
      expect(@user).to_not be_valid
    end

    it 'requires the ssn attr to only contain integers' do
      @user.ssn = "mygreatstr"
      expect(@user).to_not be_valid
    end

    it 'requires the ssn attr to only have 10 chars' do
      @user.ssn = "12345"
      expect(@user).to_not be_valid
      @user.ssn = "123"
      expect(@user).to_not be_valid
    end

    it 'requires a company' do
      @user.company = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it "has a full name method" do
      expect(@user.full_name).to eq("LNAME, FNAME")
    end
  end

  describe "relationship between admins and employees" do
    it 'allows for admins to be associated with multiple employees' do
      employee1 = FactoryGirl.create(:employee)
      employee2 = FactoryGirl.create(:employee)
      admin = FactoryGirl.create(:admin_user)

      Staff.create!(user_id: admin.id, staff_id: employee1.id)
      Staff.create!(user_id: admin.id, staff_id: employee2.id)

      expect(admin.staffs.count).to eq(2)
    end
  end
end
