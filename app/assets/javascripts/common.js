$(document).ready(function() {
	$('.lnkbtn').click (function() {
	  $("#spinner").show();
	});

	$('.selectFieldAjax').change (function() {
	  $("#spinner").show();
	});

	$('#check_all').click (function() {
	  $(this).closest('table').find('input[type=checkbox]').prop('checked', this.checked);
	});

	$('#destroy_all').click (function() {
		var checked = $(".table input:checked").length > 0;
	  if (checked) {
	  	var msg = "Are you sure want to remove selected record(s)?";
	    if(confirm(msg)){
	      $("#index_form").submit();
	    } else {
	    	return false;
	    }
	  }else {
	  	alert('Please select atleast one record');
	  	return false;
	  }
	});
});
$(function() {
  $('.pagination a').attr('data-remote', 'true')
});

function makeCombo()
{
  var j;
  var listObj = document.getElementById("morning_etime");
  var len = listObj.length
  for(i=0;i<=len;i++)
  {
    listObj.remove(listObj.selectedIndex[i]);
  }
  var newOpt;
  var stime = document.new_company.company_schedule_time_interval.value;
  var actlength = stime;
  if(stime > 0)
    var actstime = Math.floor(45/stime);

	newOpt=new Option('00','00');
	document.getElementById('morning_etime').options[0]= newOpt;
	for(var j=1;j<=actstime;j++)
  {
	  if(stime < 10)
		  stime = '0'+stime;
    newOpt = document.createElement("OPTION");
    newOpt.text =stime;
    newOpt.value =stime;
    listObj.options.add(newOpt,j);
    var stime = parseFloat(actlength) + parseFloat(stime);
  }
  stime ='';
  var listObj1 = document.getElementById("evening_etime");
	var len1 = listObj1.length

	for(i=0;i<=len1;i++)
	{
		listObj1.remove(listObj1.selectedIndex[i]);
	}
	var newOpt1;
	var stime = document.new_company.company_schedule_time_interval.value;
	var actlength = stime;

	if(stime > 0)
		var actstime = Math.floor(45/stime);

	newOpt1 = new Option('00','00');
	document.getElementById('evening_etime').options[0]= newOpt1;
	for (var k=1;k <= actstime;k++)
  {
	  if(stime < 10)
		  stime = '0'+stime;

  	newOpt1 = document.createElement("OPTION");
  	newOpt1.text =stime;
  	newOpt1.value =stime;
  	listObj1.options.add(newOpt1,k);
  	var stime = parseFloat(actlength) + parseFloat(stime);
  }
  stime = '';
  var stime = document.new_company.company_schedule_time_interval.value;
  if(stime > 0)
  var actstime = Math.floor(45/stime);

  var morningstartmin = "{MORNINGSTARTMIN}";

  for (v=0;v<=actstime;v++)
  {
    var val = document.new_company.morning_etime.options[v].value;
    if(morningstartmin == val )
    {
    	document.new_company.morning_etime.selectedIndex = v;
    }
  }
  stime = '';
  var stime = document.new_company.company_schedule_time_interval.value;
  if(stime > 0)
	  var actstime = Math.floor(45/stime);

  var eveningstartmin = "{EVENINGSTARTMIN}";

  for (c=0;c<=actstime;c++)
  {
  	var val = document.new_company.evening_etime.options[c].value;
  	if(eveningstartmin == val)
	  {
		  document.new_company.evening_etime.selectedIndex = c;
	  }
  }
}
