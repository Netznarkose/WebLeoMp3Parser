class EntriesController < ApplicationController
  require 'leo_mp3_parser'
  before_action :authorize
  before_action :set_entry, only: [:destroy]
  helper_method :languages, :last_selected_language

  def index
    @entries = Entry.for_user(current_user)
  end

  def new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id
    @entry.url = generate_url rescue nil
    if @entry.save
      redirect_to entries_path, notice: 'Entry was successfully created.'
    else
      render 'new'
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

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:term, :language, :url)
  end

  def generate_url
    leo_mp3_parser = LeoMp3Parser.new
    language_and_term = { language: @entry.language, term: @entry.term }
    leo_mp3_parser.get_audio_url(language_and_term)
  end

  def languages
    {
      'ende' => 'English',
      'esde' => 'Spanish',
      'frde' => 'French'
    }
  end

  def last_selected_language
    @last_selected_language ||= Entry.all.last.language rescue 'ende'
  end
end
