$ ->
  $("#calculate").click ->

    start_sum = $("#loan_sum").val()
    territory = parseInt($("#territory").text())

    data1 = parseInt($("#loan_date_issue_1i").val())
    data2 = parseInt($("#loan_date_issue_2i").val())
    data3 = parseInt($("#loan_date_issue_3i").val())
    start_date = new Date(data1+"/"+data2+"/"+data3)

    data4 = parseInt($("#loan_end_loan_1i").val())
    data5 = parseInt($("#loan_end_loan_2i").val())
    data6 = parseInt($("#loan_end_loan_3i").val())
    end_date = new Date(data4+"/"+data5+"/"+data6)

    count_day = (end_date - start_date)/86400000
    percent = (start_sum * territory)/100

    if count_day <= 30
      less_mount = count_day
      more_mount = 0
    else
      less_mount = 30
      more_mount = count_day - 30

    if gon.exist
      total_sum = (start_sum * territory) + (15*percent * count_day)
    else
      total_sum = (start_sum * territory) + (percent * less_mount) + (15*percent * more_mount)

    $("#loan_total_sum").html(total_sum)

$ ->
  $("#loan_exist").html("У клиента существуют непогашенные займы, ставка будет 15%") if gon.exist




