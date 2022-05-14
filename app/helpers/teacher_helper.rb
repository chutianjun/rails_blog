module TeacherHelper
  def full_name(teacher_id)
    begin
      Teacher.find_by_id(teacher_id)
    rescue Exception => e
      Rails.logger.info(e)
      ''
    ensure
    end
  end
end
