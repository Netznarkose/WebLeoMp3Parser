module EntriesHelper
  def languages
    {
      'ende' => 'English',
      'esde' => 'Spanish',
      'frde' => 'French'
    }
  end

  def store_in_session(last_selected_language)
    session[:last_key] = last_selected_language
  end

  def last_selected_language
    @last_selected_language ||= session[:last_key]
  end

  def last_selected_language_simple_form_conversion
    simple_form_conversion(languages, last_selected_language)
  end

  def languages_simple_form_conversion
    languages.map { |key, _value| simple_form_conversion(languages, key) }
  end

  def simple_form_conversion(hash, key)
    [hash[key], key]
  end
end
