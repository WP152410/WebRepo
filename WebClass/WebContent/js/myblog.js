$(function(){
  		$('#LoginForm').submit(function(event){
  			event.preventDefault();
			var id = $("#id").val();
			var pwd = $("#pwd").val();
			
			//서버로 post 방식 전송(ajax)
			$.post("http://httpbin.org/post",
			{id: id, pwd: pwd}, 
			function(data){
				//서버로부터 응답을 받으면
				var myModal1 = $('#myModal');
				myModal1.modal();
				myModal1.find('.modal-body').text(data.form.id + '님 로그인 되었습니다.');
			});
			
  		});
  	});