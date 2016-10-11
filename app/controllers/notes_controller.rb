class NotesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    
  end
  
  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to '/'
  end

  def update
    @note.update(note_params)
    redirect_to '/'    
  end
  
  def edit
    @note = Note.find(params[:id])
  end
  
  def show
    authorize current_user
  end

  def index
    @user = current_user
    if authorize @user
      @notes = Note.all
    else
      @notes = current_user.readable
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
