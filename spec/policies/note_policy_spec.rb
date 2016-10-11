describe NotePolicy do
  subject { NotePolicy }

  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }
  let (:moderator) {FactoryGirl.build_stubbed :moderator}
  let (:note) {FactoryGirl.build_stubbed :note}

  permissions :index? do
    it "denies access if just a normal user" do
      expect(subject).not_to permit(current_user)
    end
    it "allows access for an admin or a moderator" do
      expect(subject).to permit(moderator)
      expect(subject).to permit(admin)
    end
  end

  permissions :show? do
    it "allows you to see your own note" do
      expect(subject).to permit(note.user, note)
    end
    it "allows an admin or a moderator to see any note" do
      expect(subject).to permit(moderator)
      expect(subject).to permit(admin)
    end
  end

  permissions :create? do
    it "allows creating new notes" do
      expect(subject).to permit(current_user)
    end
  end

  permissions :update? do
    it "prevents updates if not an admin nor owner of the note" do
      expect(subject).not_to permit(current_user, note)
    end
    it "allow updates if owner of the note" do
      expect(subject).to permit(note.user, note)
    end
    it "allows an admin to make updates" do
      expect(subject).to permit(admin)
    end
  end

  permissions :destroy? do
    it "prevents deleting other's notes" do
      expect(subject).not_to permit(current_user, note)
    end
    it "allows deleting one's own notes" do
      expect(subject).to permit(note.user, note)
    end
    it "allows an admin to delete any note" do
      expect(subject).to permit(admin, note)
    end
  end
end
