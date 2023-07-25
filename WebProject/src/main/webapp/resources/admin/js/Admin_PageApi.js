/*
const apitable = document.getElementsByClassName('apiTable');

function selectbtn(){
	$.ajax({
	 type: 'POST',
	 url: "/admin/api/select",
	 success : function(data){
			$.each(data, function(){
				apitable.append("");
			})	 
		},
	 error :function(){
			alert("request error!");
		}
							
 	});
}
*/
function selectbtn(){
    $.ajax({
        url : "/admin/api/select",
        type: "POST",
        success : function(result) {
        	$(result).each(function(){
        		console.log(this.performance_code);
        		/* $("#apiTable").html("<tr>"
        		+"<td>this.performance_code</td>"		
        		+"<td>this.performance_name</td>"
        		+"<td>this.performance_qty</td>"
        		+"<td>this.main_category</td>"
        		+"<td>this.sub_category</td>"
        		+"<td>this.performance_price</td>"
        		+"<td>this.start_date</td>"
        		+"<td>this.end_date</td>"
        		+"<td>this.address</td>"
        		+"<td>this.place</td>"
        		+"<td>this.kid_state</td>"
        		+"<td>this.porster</td>"
        		+"</tr>"); */
			});
        }
    });
}