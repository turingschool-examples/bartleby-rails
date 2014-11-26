class NotesController < ApplicationController
  respond_to :json

  def index
    notes = { note: Note.all }
    respond_with notes
  end

  def show
    note = { note: Note.find(params[:id]) }
    respond_with note
  end

  def create
    note = Note.new(note_params)
    if note.save
      respond_with({ note: note }, :status => 201, :location => note_path(note))
    else
      respond_with({:errors => note.errors }, :status => 422, :location => notes_path)
    end
  end

  def update
    note = Note.find(params[:id])
    if note.update(note_params)
      respond_with({ note: note }, :status => 200, :location => note_path(note))
    else
      respond_with({:errors => note.errors }, :status => 422, :location => notes_path)
    end
  end

  private

  def note_params
    params.require(:note).permit(:body, :title)
  end

end