module StudentHelper
  def full_name
    Student.find_by_id(1).try(:name)
  end
end
