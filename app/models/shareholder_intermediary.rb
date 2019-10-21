# frozen_string_literal: true

class ShareholderIntermediary < ActiveRecord::Base
  belongs_to :shareholder_relationship
  belongs_to :intermediary_company
end
