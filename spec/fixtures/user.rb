require 'active_record'

class User < ActiveRecord::Base
  include Paperclip::Glue

  has_attached_file :avatar, {
    storage: :foggy,
    url: ':class/:attachment/:id/:style/:filename',
    path: ':class/:attachment/:id/:style/:filename',
  }
end
