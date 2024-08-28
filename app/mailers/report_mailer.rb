class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.send_report.subject
  #
  def send_report()
    @student_id = params[:id]
    @student = Student.find(params[:id])
    logger.info "student is #{@student.inspect}"
    @grades = Grade.where(student_id: @student_id)
     @assessment_conduct = Assessment.where(student_id: @student_id)

    logger.info"------------- #{@assessment_conduct.inspect}"

    @pdfparams = ReportForm.last


    @grades = Grade.where(student_id: @student_id)
    logger.info "this is grades for student #{@grades.inspect}"

    @report_remark = Remark.where(stud_id: @student_id)

    #
    if @report_remark.present?
    @conduct = @report_remark[0].teacher_conduct
    @remark = @report_remark[0].teacher_remark

    logger.info "===== #{@student_id}"

    logger.info "=====Conduct #{@conduct}"

    logger.info "=====Remark #{@remark}"
    else
 @conduct = "none"
  @remark = "none"
    end

      if @pdfparams.present?

    @resident_total = (@pdfparams.resident_cost_per_day * @pdfparams.resident_no_of_days)

    logger.info "This is the resident total----- #{@resident_total}"

    @non_resident_total = (@pdfparams.nr_cost_per_day * @pdfparams.nr_no_of_day)

    logger.info "This is the resident total----- #{@non_resident_total}"

    else
 @resident_total = "not available"
  @non_resident_total = "not available"
    end

    @student_name = Grade.joins("INNER JOIN students ON students.id = grades.student_id").select("first_name,last_name").where(student_id: @student_id)
    logger.info "this is name #{@student_name[0].first_name}"
    
    
    
    @url  = 'http://example.com/login'
    @greeting = "Dear"
   

    attachments["report.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'grades/email_report.html.erb', pdf: 'report')
    )
    mail to: @student.email, subject: "End of Term Examination Report",
    notice: "Report sent successfully"

  end
end
