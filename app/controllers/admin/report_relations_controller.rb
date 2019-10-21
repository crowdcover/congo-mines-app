# frozen_string_literal: true

class Admin::ReportRelationsController < Admin::Auth
  active_scaffold :report_relation do |conf|
  end
end
