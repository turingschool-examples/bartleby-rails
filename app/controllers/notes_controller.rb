class NotesController < ApplicationController
  def create
    note = Note.new(note_params)
    if note.save
      notice = "Successfully created note."
    else
      notice = "Not able to create note."
    end
    redirect_to dashboard_path, notice: notice
  end

  private

  def note_params
    params.require(:note).permit(:body, :title)
  end

end
