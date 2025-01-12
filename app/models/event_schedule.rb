class EventSchedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }
  validate :check_dates_order

  private

  def check_dates_order
    if start_date.present? && end_date.present? && end_date <= start_date
      errors[:base] << '終了日は開始日より後の日付を選択してください'
    end
  end
end
