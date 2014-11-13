class Background < ActiveRecord::Base
  validates :title, presence: true

  has_attached_file :image, :styles => {:iphone4 => "640x960#",
                                        :iphone5 => "640x1136#",
                                        :iphone6 => "750x1334#",
                                        :iphone7 => "1242x2208#",
                                        :huge => "1080x1920#",
                                        :large => "800x1280#",
                                        :medium => "640x960#",
                                        :small => "320x480#",
                                        :thumb => "160x240#"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  process_in_background :image, :only_process => [:iphone5, :iphone6, :iphone7, :huge, :medium]
  delegate :url, to: :image
end
