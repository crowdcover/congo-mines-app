# frozen_string_literal: true

class Admin::AuthorsController < Admin::Auth
  active_scaffold :author do |conf|
  end
end
