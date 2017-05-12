class Post < ActiveRecord::Base
    #validates :title, presence: true, message: "ERROR!!"
  belongs_to :user
end
