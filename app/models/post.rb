class Post < ApplicationRecord
    validates :title, {presence: true, length: {maximum: 20}}
    validates :start_day, {presence: true}
    validates :end_day, {presence: true}
    validates :memo, {length: {maximum: 500}}
    validate :end_day_is_later_than_start_day

  def end_day_is_later_than_start_day
    if start_day.present? && end_day <= start_day
      errors.add(:expiration_date, "終了日が開始日よりも前の日付になっています")
    end
  end
end
