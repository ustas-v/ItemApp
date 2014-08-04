# -*- encoding: utf-8 -*-

class Item < ActiveRecord::Base

  attr_accessible :name, :picture

  has_attached_file :picture,
                    styles: { thumb: '100x100#' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true

  scope :ordered, order(:id.desc)

  def picture_for_list
    self.picture.url(:thumb)
  end
end
