class StudentsController < ApplicationController
  def index
    matching_students = Student.all

    @list_of_students = matching_students.order({ :created_at => :desc })

    render({ :template => "students/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    @number_of_enrollment = Enrollment.where({ :student_id => the_id }).count

    # @the_student = matching_students.at(0)
    @the_student = Student.where({ :id => the_id }).at(0)

    render({ :template => "students/show.html.erb" })
  end
end
