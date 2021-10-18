# frozen_string_literal: true

# Specific seeds by environment
env_file = Rails.root.join('db', 'seeds', "#{Rails.env}.rb")
require env_file if env_file.exist?
