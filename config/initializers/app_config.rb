# Load app.yml

Unify::APP_CONFIG = YAML.load_file(File.join(Rails.root, 'config', 'app.yml'))[Rails.env]
Unify::SUPPORTED_LOCALES = {}
