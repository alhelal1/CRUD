<!DOCTYPE html>
<html>
<head>
<title></title>
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script type="text/javascript">
	$(function() {
		$('#allList2').hide();
		$('#clk').click(function(e) {
			
			//alert("1234");
			//console.log($('form[name="form"]').serailize());
			//alert($('form').serialize());
			$.ajax({
				type:"POST",
				url:"/save",
				//Content-Type: "application/json",
				data:$('form').serialize(),
				success:function(res)
				{
					//console.log(res);
					
					$.ajax({
						type:"GET",
						url:"/findAll",
						//Content-Type: "application/json",
						
						
						
						success:function(rest)
						{
							
							var output="";
							//console.log(rest);
							
							
							$.each(rest,function(key,val)
							{
								//console.log(val.name);
								output+="<tr> <td>"+val.name+"</td>"+"<td>"+val.email+"</td>";
								output+='<td> <button type="button" onClick="edit('+val.id+')">Edit</button> </td>';
								output+="</tr>";
								//output+="<tr> <td>"+val.name+"</td>"+"<td>"+val.email+"</td> </tr>";

							});
							$('#registrationForm').hide();
							$('#allList2').show();
							$("#allList").append(output);
							
							
						}
					
					
						
						
					
					});
				}
			
			});

			
		});
		
		
	});
	function edit(id){
		alert(id);
	}
</script>
</head>
<body>
    <div id="registrationForm">
	<form class="form-horizontal" name="form">
		<fieldset>
			<div id="legend">
				<legend class="">Register</legend>
			</div>
			<div class="control-group">
				<!-- Username -->
				<label class="control-label" for="username">Username</label>
				<div class="controls">
					<input type="text" id="username" name="name" placeholder=""
						class="input-xlarge">
					<p class="help-block">Username can contain any letters or
						numbers, without spaces</p>
				</div>
			</div>

			<div class="control-group">
				<!-- E-mail -->
				<label class="control-label" for="email">E-mail</label>
				<div class="controls">
					<input type="text" id="email" name="email" placeholder=""
						class="input-xlarge">
					<p class="help-block">Please provide your E-mail</p>
				</div>
			</div>




		</fieldset>
	</form>
	<div class="control-group">
		<!-- Button -->
		<div class="controls">
			<button class="btn btn-success" id="clk">Register</button>
		</div>
	</div>
	
	</div>
	
	<div id="allList2">
	<table  id="allList" border="1">
	 <tr>
	 <th>Name</th>
	 <th>Email</th>
	 <th>Edit</th>
	 
	 </tr>
	</table>
	</div>

</body>
</html>