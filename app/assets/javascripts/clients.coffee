# $ ->
#   loan_sum = $("#loan_sum").val()
#   territory = parseInt($("#territory").text())

#   data1 = parseInt($("#loan_date_issue_1i").val())
#   data2 = parseInt($("#loan_date_issue_2i").val())
#   data3 = parseInt($("#loan_date_issue_3i").val())
#   start_date = new Date(data1+"/"+data2+"/"+data3)

#   data4 = parseInt($("#loan_end_loan_1i").val())
#   data5 = parseInt($("#loan_end_loan_2i").val())
#   data6 = parseInt($("#loan_end_loan_3i").val())
#   end_date = new Date(data4+"/"+data5+"/"+data6)

#   day = (end_date - start_date)/86400000

#   sum_and_territory = loan_sum * territory

#   loan_mount = day if day >= 30
#   more_loan_mount = day - 30 if day > 30
#   one_sum_and_territory_in_percent = sum_and_territory/100 *

#   total_sum = sum_and_territory + loan_mount * one_sum_and_territory_in_percent + more_loan_mount * (one_sum_and_territory_in_percent * 15)

#   $("#loan_total_sum").val(total_sum)
