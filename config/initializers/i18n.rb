require 'i18n/backend/fallbacks'

I18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}')]

I18n::Backend::Simple.include(I18n::Backend::Fallbacks)
I18n.available_locales = %i[en pt-BR]
I18n.fallbacks.map({ 'pt' => :'pt-BR', 'en' => :en })
I18n.default_locale = :'pt-BR'
