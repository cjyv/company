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

	function Change(e) {
		const confirm = window.confirm("本当にプロフィーを修正しますか？");
		if(confirm){
			 if (!checkUserName(profileForm.name.value)) {
		            return false;
		        } else if (!checkAddress(profileForm.e_address.value)) {
		            return false;
		        } else if (!checkPhone(profileForm.tellphone1.value,profileForm.tellphone2.value,profileForm.tellphone3.value)) {
		            return false;
		        }else{
		return true;
		        }
		}else{
			return false;
		}
	}

	function checkExistPhone(number1,number2,number3, dataName) {
	    if (number1 == "" || number2=="" || number3=="") {
	        alert(dataName + " 記入してください。");
	        return false;
	    }
	    return true;
	}


	function checkUserName(name) {
	    //이름가 입력되었는지 확인하기
	    if (!checkExistData(name, "名前を"))
	        return false;

	    var nameRegExp = /^[ぁ-ゔァ-ヴー々〆〤一-龥]/; //이름 유효성 검사
	    if (!nameRegExp.test(name)) {
	        alert("名前は日本語で記入してください。");
	        profileForm.name.value = "";
	        profileForm.name.focus();
	        return false;
	    }
	    return true; //확인이 완료되었을 때
	}

	function checkAddress(address) {
	    //주소가 입력되었는지 확인하기
	    if (!checkExistData(address, "住所を"))
	        return false;

	    var addressRegExp = /^[a-zA-zぁ-ゔァ-ヴー々〆〤一-龥0-9]/; //주소 유효성 검사
	    if (!addressRegExp.test(address)) {
	        alert("住所は英語又は日本語で記入してください。");
	        profileForm.e_address.value = "";
	        profileForm.e_address.focus();
	        return false;
	    }
	    return true; //확인이 완료되었을 때
	}

	function checkPhone(number1,number2,number3) {
	    //번호가 입력되었는지 확인하기
	    if (!checkExistPhone(number1,number2,number3, "電話番号を"))
	        return false;
		
	    
	    var phoneRegExp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}/; //번호 유효성 검사
	    if (!phoneRegExp.test(number1+number2+number3)) {
	        alert("電話番号は数字で記入してください。");
	       ;
	        profileForm.tellphone1.focus();
	        return false;
	    }
	    return true; //확인이 완료되었을 때
	}

	function passwordChange(e) {
		const confirm = window.confirm("パスワードを変更しますか？");
		if(confirm){
			window.location.href="/";
		}else{
			e.preventdefault();
		}
	}
	