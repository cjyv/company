function checkAll() {

	if (!checkUserId(form.e_id.value)) {
		return false;
	} else if (!checkPassword(form.password.value)) {
		return false;
	}
	return true;
}

//  공백확인 함수    
function checkExistData(value, dataName) {        
if (value == "") {          
	  alert(dataName + " 입력해주세요!");    
	        return false;    
	    }    
	    return true;   
	 }  
	
	   function checkUserId(e_id) {   
		     // Id가 입력되었는지 확인하기      
		  if (!checkExistData(e_id, "아이디를"))       
		     return false;      
		   var idRegExp = /^[a-zA-z0-9]{1,12}$/; //아이디 유효성 검사   
		     if (!idRegExp.test(e_id)) { 
			           alert("아이디는 영문 대소문자와 숫자 1~12자리로 입력해야합니다!");  
		          form.e_id.value = "";   
		         form.e_id.focus();       
		     return false;       
		 }        return true; //확인이 완료되었을 때    }
	}

	 function checkPassword(password) {      
		  //비밀번호가 입력되었는지 확인하기      
		  if (!checkExistData(password, "비밀번호를"))  
		          return false;
	var passwordRegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사     
	   if (!passwordRegExp.test(password)) {     
		       alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");   
		         form.password.value = "";         
		   form.password.focus();          
		  return false;      
		  }
	 return true; //확인이 완료되었을 때   
	 }


	