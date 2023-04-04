class User < ApplicationRecord 
    validates :title, presence: true
    validates :schedule, presence: true
    validates :title, length: { maximum: 20 }
    validates :schedule, length: { maximum: 500 }
    validate :start_end_check
    def start_end_check
      errors.add( :end_date,"終了日は開始日より前の日付は登録できません。") unless
      self.start_date < self.end_date 
      end
   end
  
