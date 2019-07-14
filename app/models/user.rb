class User < ApplicationRecord
  # include in article
  authenticates_with_sorcery!
end
