class Attendance < ApplicationRecord

	after_create :event_send

  def event_send
    AttendanceMailer.attendance_email(self.user).deliver_now
  end

	belongs_to :user
  belongs_to :event

end
