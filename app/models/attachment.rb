class Attachment < ApplicationRecord

  has_attached_file :file
  do_not_validate_attachment_file_type :file

  belongs_to  :user
  belongs_to  :parent, :polymorphic => true
end