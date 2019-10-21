# frozen_string_literal: true

json.call(@report, :title, :actual_post_date, :summary, :drc_companies, :categories)

json.source @report.source

json.attachments @report.attachments, :asset

json.categories @report.categories, :parent

json.drc_companies @report.drc_companies, :name
