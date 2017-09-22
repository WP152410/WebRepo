$(function(){
$('#SigninForm').submit(function(event){
  			event.preventDefault();
			var number = $("#number").val();
			var name = $("#name").val();
			
			//서버로 post 방식 전송(ajax)
			$.post("http://httpbin.org/post",
			{number: number, name: name}, 
			function(data){
				//서버로부터 응답을 받으면
				var myModal0 = $('#myModal0');
				myModal0.modal();
				myModal0.find('.modal-body').text(data.form.name + '님이 회원가입 되었습니다.');
			});
			
  		});
	});