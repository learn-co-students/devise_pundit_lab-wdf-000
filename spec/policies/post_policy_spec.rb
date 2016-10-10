require 'rails_helper'

RSpec.describe PostPolicy do

  # let(:user) { User.new }
  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:other_user) { FactoryGirl.build_stubbed :user }
  let (:moderator) { FactoryGirl.build_stubbed :user, :moderator }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }

  let (:note) { FactoryGirl.build_stubbed :note}
  subject {PostPolicy}

  permissions :index?  do
    it "denies access if neither admin nor moderator" do
      expect(subject).not_to permit(current_user)
    end
    it "allows amins and moderators too see all the notes" do
      expect(subject).to permit(moderator)
      expect(subject).to permit(admin)
    end
  end

  permissions :show? do
    it "allows admins and moderators to see all the notes" do
      expect(subject).to permit(moderator)
      expect(subject).to permit(admin)
    end
    it "prevents other users from seeing your profile" do
      expect(subject).not_to permit(current_user, other_user)
    end
    it "allows you to see your own notes" do
      expect(subject).to permit(note.user, note)
    end
  end

  permissions :create? do
    it "allows creating new notes" do
      expect(subject).to permit(current_user)
    end
  end

  permissions :update? do
    it "prevents updates it not an admin or owner of the note" do
      expect(subject).not_to permit(current_user)
    end
    it "allows updates if owner of the note" do
      expect(subject).to permit(note.user, note)
    end
    it "allows an admin to make updates" do
      expect(subject).to permit(admin)
    end
  end

  permissions :destroy? do
    it "prevents deleting other notes" do
      expect(subject).not_to permit(current_user, note)
    end
    it "allows deleting onwner's own note" do
      expect(subject).to permit(note.user, note)
    end
    it "prevents a moderator to delete any note" do
      expect(subject).not_to permit(moderator, note)
    end
    it "allows an admin to delete any note" do
      expect(subject).to permit(admin, note)
    end
  end
end
