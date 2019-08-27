class Language < ApplicationRecord
  has_many :metadata_languages
  has_many :metadatas, through: :metadata_languages
end
