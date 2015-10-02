# Be sure to restart your server when you modify this file.


search_filters = {
    :religions    => {},
    :castes       => {},
    :regions      => [],
    :languages    => [],
    :communities  => [],
    :countries    => [],
}
# Load the supported locales
locales = DimLocale.select('id, name')
# Set to the app variable
Unify::SUPPORTED_LOCALES = locales.map(&:serializable_hash) if(locales.present?)
Unify::SUPPORTED_LOCALES_JSON = Unify::SUPPORTED_LOCALES.to_json if Unify::SUPPORTED_LOCALES.present?
locales.each do |locale|
  # Load all Religions
  #record_set = DimReligion.where('locale_id = ?', locale.id).select('id, name')
  # set it to the search_filter array
  #search_filters[:religions][locale.id] = record_set.map(&:serializable_hash) if(record_set.present?)
  ## Load all Castes
  #record_set = DimCaste.where('locale = ?', locale[0]).select('id, name, religion_id')
  #search_filters[:castes][locale[0]] = record_set.map(&:serializable_hash) if(record_set.present?)
  ## Load all Zodiac Signs
  #record_set = DimZodiacSign.where('locale = ?', locale[0])
  #search_filters[:communities][locale[0]] = record_set.map(&:serializable_hash) if(record_set.present?)
  ## Load all Communities
  #record_set = DimCommunity.where('locale = ?', locale[0]).select('id, name')
  #search_filters[:communities][locale[0]] = record_set.map(&:serializable_hash) if(record_set.present?)
  ## Load all Language
  #record_set = DimLanguage.where('locale = ?', locale[0]).select('id, name')
  #search_filters[:languages][locale[0]] = record_set.map(&:serializable_hash) if(record_set.present?)
  ## Load all Countries
  #record_set = DimCountry.where('locale = ?', locale[0])
  #search_filters[:countries][locale[0]] = record_set.map(&:serializable_hash) if(record_set.present?)
  ## Load all Cities
  #record_set = DimCity.where('locale = ?', locale[0]).select('id, name')
  #search_filters[:cities].push record_set.map(&:serializable_hash) if(record_set.present?)

end

# Set all search filters to an app context variable
Unify::SEARCH_FILTERS = search_filters