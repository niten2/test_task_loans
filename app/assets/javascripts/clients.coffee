# $("#loan_total_sum").val(1)

$ ->
  loan_sum = $("#loan_sum").val()
  territory = parseInt($("#territory").text())

  data1 = parseInt($("#loan_date_issue_1i").val())
  data2 = parseInt($("#loan_date_issue_2i").val())
  data3 = parseInt($("#loan_date_issue_3i").val())
  start_date = new Date(data1+"/"+data2+"/"+data3)

  data4 = parseInt($("#loan_end_loan_1i").val())
  data5 = parseInt($("#loan_end_loan_2i").val())
  data6 = parseInt($("#loan_end_loan_3i").val())
  end_date = new Date(data4+"/"+data5+"/"+data6)


  term_date = new Date(start_date - end_date)
