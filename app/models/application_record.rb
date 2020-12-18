class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to shards: {
    default: { write: :primary, read: :primary },
    pliano: {  write: :pliano, read: :pliano  },
    novagraf: {  write: :novagraf, read: :novagraf }
  }
end
