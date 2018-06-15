class Interview < ApplicationRecord
  enum state: { 保留:0, 承認:1, 却下:2}
  belongs_to :user
end
