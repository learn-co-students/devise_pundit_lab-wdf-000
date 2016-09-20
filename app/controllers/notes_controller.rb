class NotesController < ApplicationController
  before_action :authenticate_user!
  def new

  end

  def create
    @note = Note.create(content: note_params[:content])
    @note.user = current_user
    @note.visible_to=note_params[:visible_to]
    @note.readers << current_user
    @note.save
    redirect_to '/'
  end

  def update
    @note = Note.find(params[:id])
    @note.update(content: note_params[:content])
    @note.visible_to=note_params[:visible_to]
    @note.readers << current_user  unless @note.readers.include?(current_user)
    @note.save
    redirect_to '/'
  end

  def edit
    @note = Note.find(params[:id])
  end

  def show
    @note = Note.find(params[:id])
    if authorize @note
    else
      redirect_to '/'
    end
  end

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
