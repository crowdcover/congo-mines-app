# frozen_string_literal: true

class Attachment < ActiveRecord::Base
  acts_as_list
  belongs_to :attachable, polymorphic: true

  has_attached_file :asset # , styles: {thumbnail: "60x60#"}
  validates_attachment :asset, content_type: { content_type: 'application/pdf' }

  validates_attachment_file_name :asset,
                                 matches: [/pdf\Z/, /doc\Z/, /docx\Z/],
                                 message: ', Only PDF or WORD files are allowed. '

  #   validates_attachment :asset,
  #     presence: true,
  #     content_type: { content_type: ["image/jpeg", "application/pdf"] },
  #     size:         { less_than: 5.megabytes },
  #     file_name:    { matches: [/png\Z/, /jpe?g\=end
  #
  #
  #   validates_attachment_size :asset, less_than: 4.megabytes
  #   validates_attachment_file_name :asset,
  #       matches:   [/pdf\Z/, /doc\Z/, /docx\Z/],
  #       message:   ', Only PDF or WORD files are allowed. '
  #
  # validates_with AttachmentSizeValidator, attributes: :asset, :less_than => 6.megabytes
  # validates_attachment :asset, content_type: { content_type: "application/pdf" }

  def to_label
    asset_file_name
  end

  private
end
