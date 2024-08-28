class Lesson < ApplicationRecord
    # has_one_attached :avafile

    # validate :check_file_type

     def to_a
    []
  end

  private

  # def check_file_type
  #   if avafile.attached? && !avafile.content_type.in?(%w(application/pdf))
  #     avafile.purge # delete the uploaded file
  #     errors.add(:avafile, 'Must be a PDF')
  #   end
  # end
 
end
