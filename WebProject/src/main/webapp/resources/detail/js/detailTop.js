const calendar = document.querySelector('.placeholder'); // 캘린더
const popupTimeDiv = document.querySelector('.popup-time-parent'); // 타임테이블 부모
const qtyParents = document.querySelectorAll('.popup-qty-parent'); // 수량
const qtyPirce = document.querySelectorAll('.popup-qty-price');
const plusBtns = document.querySelectorAll('.qty-plus'); // +
const minusBtns = document.querySelectorAll('.qty-minus'); // -
const paymentBtn = document.querySelector('#popup-payment-btn'); // 결제하기
let selectedDate; // 선택한 날짜
let selectedInput; // 선택한 시간

// 전시 파트
const optionBtn = document.querySelector('#popup-option-btn');

// 최저가 출력 - 더 좋은 방법을 찾아보쟝 ... 
const age = chkAge();
const lowestprice = document.querySelector('#lowestprice');
if (age >= 15) {
	lowestprice.textContent = qtyPirce[0].textContent + "원 ~";
} else if (age >= 7) {
	lowestprice.textContent = qtyPirce[1].textContent + "원 ~";
} else {
	lowestprice.textContent = qtyPirce[2].textContent + "원 ~";
}

// flatpickr 캘린더 설정
flatpickr.localize(flatpickr.l10ns.ko);

if (calendar) {
calendar.flatpickr({
    local: 'ko',
    inline: true,
    showMonths: 1,
    minDate: chkStartDate(calendar.dataset.startdate),
    maxDate: (calendar.dataset.maxdate), // 날짜 형식 yyyy-mm-dd
    // 공연 없는 요일은 표시 X, 전시 해당 안됨
	enable: [
		function(date) {
			if (timetable) {
			const day = date.getDay();
			return timetable[day] !== undefined;	
			}		
		}
	],    
    // 날짜 선택 시, 시간선택 오픈 및 초기화
    onChange : function(selectDates, dateStr, calendar) {
        showTimeTable(new Date(dateStr).getDay());
        selectedDate = dateStr;
    }
});
}

// 전시 - 옵션 선택
if (optionBtn) {
	optionBtn.addEventListener('click', (e) => {
		e.target.style.backgroundColor = '#46c8b4';
		openQtyDiv();
		resetQty();
	});
}
// 권종/수량 선택 시, 총 가격 및 결제하기 활성화
// plus 버튼
plusBtns.forEach(function (button) {
    button.addEventListener('click', function () {
        let parent = this.parentNode;
        let qtyValue = parent.querySelector('.qty-value');
        let currentQty = parseInt(qtyValue.value);    
        
		let currentTotalQty = 0;
        qtyParents.forEach(function (parent) {
        	currentTotalQty += parseInt(parent.querySelector('.qty-value').value);
   		 });
        
        // 수량 증가 (남은 티켓 이상 불가)
        if (currentTotalQty == totalQty) {
            alert('구매 가능한 티켓 수량을 초과하였습니다.');
        } else {
			qtyValue.value = ++currentQty;
		}

        // 총 결제금액 업데이트
        updateTotalPrice();
        openPriceDiv();
    });
});
// minus 버튼
minusBtns.forEach(function (button) {
    button.addEventListener('click', function () {
        var parent = this.parentNode;
        var qtyValue = parent.querySelector('.qty-value');
        var currentQty = parseInt(qtyValue.value);

        // 수량 감소 (0 미만으로는 내려가지 않도록 조정)
        currentQty = Math.max(currentQty - 1, 0);
        qtyValue.value = currentQty;

        // 총 결제금액 업데이트
        updateTotalPrice();
        openPriceDiv();
    });
});

/* ★ 함수 영역 ★ */

// 타임 테이블 div 생성
function showTimeTable(date) {
  const timeArray = timetable[date];

  // 이전에 표시된 내용이 있다면 삭제
  popupTimeDiv.innerHTML = "";
  
  const titleElement = document.createElement("div");
  titleElement.className = "popup-text";
  titleElement.textContent = "시간선택";
  
  popupTimeDiv.appendChild(titleElement);

  for (const time of timeArray) {
    const timeParts = time.split(",");
    
    for (const t of timeParts) {
      const buttonInput = document.createElement("input");
      buttonInput.setAttribute("type", "text");
      buttonInput.setAttribute("name", "booking_time");
      buttonInput.setAttribute("value", t);
      buttonInput.setAttribute("class", "popup-time");
      buttonInput.setAttribute("form", "payment_proceed");
      buttonInput.readOnly = true;
      
      // Time 클릭 시, 색 변환 및 수량 open
      buttonInput.addEventListener('click', (e) => {
		  resetTimeDiv(); // 초기화
	       e.currentTarget.style.backgroundColor = '#46c8b4'; // 선택된 것만 색 변경    
	       selectedInput = e.currentTarget.value;
	       if (e.currentTarget) {
	           openQtyDiv();
	       }
	  })
	  
      popupTimeDiv.appendChild(buttonInput);
    }
  }  
  openTimeDiv();  
}

// 시간 선택 div open
function openTimeDiv() {
    resetTimeDiv(); // 오픈 시, 시간선택 초기화
    closeQtyDiv(); // 오픈 시, qty 닫힘 밑 초기화
    popupTimeDiv.style.display = 'flex';
    paymentBtn.disabled = true;
}

// 시간 선택 초기화
function resetTimeDiv() {	
	const timeDiv = document.querySelectorAll('.popup-time');	
    timeDiv.forEach(function (element) {
        element.style.backgroundColor = '#f5f5f5';
    });
    paymentBtn.disabled = true;
}

// 권종/수량 div open
function openQtyDiv() {
    closeQtyDiv();
    paymentBtn.disabled = true;
	document.querySelector('.popup-qty').style.display = "grid";
    
    // 연령 체크해서 qty 표출
    if (age >= 15) {
		qtyParents[0].style.display = "grid";
	} else if (age >= 7) {
		qtyParents[0].style.display = "grid";
		qtyParents[1].style.display = "grid";
	} else {
		qtyParents.forEach(a=>a.style.display = "grid");
	}    
}

// 권종/수량 div close
function closeQtyDiv() {
    document.querySelector('.popup-qty').style.display = 'none';
    document.querySelectorAll('.popup-qty-value').forEach(a=>a.style.display = 'none');
    document.querySelector('.popup-totalPrice').style.display = 'none';
    resetQty();
}

// 총 가격 div open, 결제하기 버튼 활성화
function openPriceDiv() {
    document.querySelector('.popup-totalPrice').style.display = 'grid';
}

// +, - 버튼 클릭 시에 총 금액 계산
function updateTotalPrice() {
    let totalPrice = 0;

    // 각 권종별로 총 가격 계산
    qtyParents.forEach(function (parent) {
        const price = parseInt(parent.querySelector('.popup-qty-price').value);
        const qty = parseInt(parent.querySelector('.qty-value').value);
        totalPrice += price * qty;
    });
    
    if (totalPrice > 0) {
		paymentBtn.disabled = false;
	} else {
		paymentBtn.disabled = true;
	}
    // 총 결제금액 표시
    document.getElementById('popup-totalPrice-value').value = totalPrice;
}

// 선택한 qty, 총 결제금액 초기화
function resetQty() {
    qtyParents.forEach(function (parent) {
        parent.querySelector('.qty-value').value = 0;
    });    
    document.getElementById('popup-totalPrice-value').value = 0;
}

// 시작 날짜 계산
function chkStartDate(startdate) {
	const date = new Date(startdate);	
	if (date < "today") {
		date = "today";
	}
	return date;
}

// 연령 계산 - qty div에서 사용
function chkAge() {	
	const age = document.querySelector('#detail-top-age').textContent;	
	if (age.includes('만')) {
		return age.substring(age.indexOf(' '), age.indexOf('세'));
	} else {
		return 0;
	}
}

// 결제하기 버튼 클릭 시 이벤트
paymentBtn.addEventListener('click', (e) => {
	const myForm = document.getElementById('payment_proceed');
    const formData = new FormData(myForm);
    const jsonData = {};

    formData.forEach((value, key) => {
      jsonData[key] = value;
    });
    
    if (selectedInput) {
    	jsonData["booking_time"] = selectedInput;
  	}
    
    jsonData["booking_date"] = selectedDate;
    
    // JSON 보내기
	 
});