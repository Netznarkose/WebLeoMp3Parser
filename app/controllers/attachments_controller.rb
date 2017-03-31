class AttachmentsController < ApplicationController
  def download
    entry_url = params[:entry_url]
    term = params[:term]
    data = open(entry_url)
    send_data data.read, filename: "#{term}.mp3", type: "application/mp3", disposition: 'inline', stream: 'true', buffer_size: '4096'
  end
end
