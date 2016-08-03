require 'rails_helper'

RSpec.describe NotePolicy do

  let(:user) { User.new }

  subject { described_class }

  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:other_user) { FactoryGirl.build_stubbed :user }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }

  let (:note) { Note.create(content: "", user_id: current_user.id) }

  permissions :show? do
    it "allows user to see their own note" do
      expect(subject).to permit(current_user, note)
      expect(subject).not_to permit(other_user, note)
    end
    it "allows an admin to see updates" do
      expect(subject).to permit(admin, note)
    end
  end

  permissions :update? do
    it "allows self to make updates" do
      expect(subject).to permit(current_user, note)
    end
    it "allows an admin to make updates" do
      expect(subject).to permit(admin, note)
    end
  end

  permissions :destroy? do
    it "allows user to delete their own note" do
      expect(subject).to permit(current_user, note)
      expect(subject).not_to permit(other_user, note)
    end
    it "allows an admin to delete notes" do
      expect(subject).to permit(admin, note)
    end
  end
end
