require 'pry'
require 'spec_helper'

describe NotePolicy do
  subject { NotePolicy }


  ##copied from UserPolicy
  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:viewer) { FactoryGirl.build_stubbed :user, :viewer }
  let (:moderator) { FactoryGirl.build_stubbed :user, :moderator }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }
  let (:note) { FactoryGirl.build_stubbed :note }


  permissions :create? do
    it "allows creating new notes" do
      expect(subject).to permit(current_user)
    end
  end

  permissions :update? do
    spy = FactoryGirl.build(:user)
    it "prevents updates if not an admin nor owner of the note" do
      expect(subject).not_to permit(spy,note)
    end
    it "allow updates if owner of the note" do
      expect(subject).to permit(note.user, note)
    end
    it "allows an admin to make updates" do
      expect(subject).to permit(admin, note)
    end
  end


  permissions :destroy? do
    spy = FactoryGirl.build(:user)
    it "prevents deleting other's notes" do
      expect(subject).not_to permit(spy, note)
    end
    it "allows deleting one's own notes" do
      expect(subject).to permit(note.user, note)
    end
    it "allows an admin to delete any note" do
      expect(subject).to permit(admin, note)
    end
  end


  permissions :index? do
    it "allows admins and moderators to see all notes" do
      expect(subject).to permit(moderator)
      expect(subject).to permit(admin)
    end
  end


  permissions :show? do

    it "allows admins and moderators to see every note" do
      expect(subject).to permit(moderator)
      expect(subject).to permit(admin)
    end
    it "prevents other users from seeing notes they are not viewers of" do
      # expect(subject).not_to permit(current_user, other_user)
    end
    it "allows users to see all notes they own" do

      expect(subject).to permit(note.user, note)
    end
  end

end
