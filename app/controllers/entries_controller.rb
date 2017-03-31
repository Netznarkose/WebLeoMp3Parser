class EntriesController < ApplicationController
  require 'leo_mp3_parser'
  before_action :set_entry, only: [:destroy]

  def index
    @entries = Entry.all
    @entry = Entry.new
    @last_entry_language = Entry.all.last.language rescue 'ende'
    @languages_manual = { 'ende' => 'English', 'esde' => 'Spanish', 'frde' => 'French' }
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.url = generate_url
    if @entry.save
      redirect_to entries_path, notice: 'Entry was successfully created.'
    else
      render :index
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  def remove_all
    Entry.delete_all
    redirect_to entries_url, notice: "You have removed all entries!"
  end

  private

  def generate_url
    leo_mp3_parser = LeoMp3Parser.new
    language_and_term = { language: @entry.language, term: @entry.term }
    leo_mp3_parser.get_audio_url(language_and_term)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:term, :language, :url)
  end
end
