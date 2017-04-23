class EntriesController < ApplicationController
  include EntriesHelper
  require 'leo_mp3_parser'
  before_action :authorize
  before_action :find_entry, only: [:destroy]
  helper_method :languages, :languages_simple_form_conversion, :last_selected_language_simple_form_conversion

  def index
    @entries = Entry.for_user(current_user)
  end

  def new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id
    @entry.url = generate_url(@entry.language, @entry.term) if @entry.term.present?
    store_in_session(@entry.language)
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
    Entry.for_user(current_user).delete_all
    redirect_to entries_url, notice: "You have removed all entries!"
  end

  private

  def find_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:term, :language, :url)
  end

  def generate_url(language, term)
    language_and_term = { language: language, term: term }
    leo_mp3_parser = LeoMp3Parser.new
    leo_mp3_parser.get_audio_url(language_and_term) rescue 'not found!'
  end
end
