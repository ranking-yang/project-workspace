const calendar = document.querySelector('.placeholder'); // 캘린더
const popupTimeDiv = document.querySelector('.popup-time-parent'); // 타임테이블 부모
const qtyParents = document.querySelectorAll('.popup-qty-parent'); // 수량
const qtyPirce = document.querySelectorAll('.popup-qty-price');
const plusBtns = document.querySelectorAll('.qty-plus'); // +
const minusBtns = document.querySelectorAll('.qty-minus'); // -
const paymentBtn = document.querySelector('#popup-payment-btn'); // 결제하기

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

calendar.flatpickr({
    local: 'ko',
    inline: true,
    showMonths: 1,
    minDate: chkStartDate(calendar.dataset.startdate),
    maxDate: (calendar.dataset.maxdate), // 날짜 형식 yyyy-mm-dd
    // 공연 없는 요일은 표시 X
	enable: [
		function(date) {
			const day = date.getDay();
			return timetable[day] !== undefined;			
		}
	],    
    // 날짜 선택 시, 시간선택 오픈 및 초기화
    onChange : function(selectDates, dateStr, calendar) {
        console.log(dateStr); // 선택한 날짜 yyyy-mm-dd
        showTimeTable(new Date(dateStr).getDay());
    }
});

// 권종/수량 선택 시, 총 가격 및 결제하기 활성화
// plus 버튼
plusBtns.forEach(function (button) {
    button.addEventListener('click', function () {
        let parent = this.parentNode;
        let qtyValue = parent.querySelector('.qty-value');
        let currentQty = parseInt(qtyValue.textContent);    
        
		let currentTotalQty = 0;
        qtyParents.forEach(function (parent) {
        	currentTotalQty += parseInt(parent.querySelector('.qty-value').textContent);
   		 });
        
        // 수량 증가 (남은 티켓 이상 불가)
        if (currentTotalQty == totalQty) {
            alert('구매 가능한 티켓 수량을 초과하였습니다.');
        } else {
			qtyValue.textContent = ++currentQty;
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
        var currentQty = parseInt(qtyValue.textContent);

        // 수량 감소 (0 미만으로는 내려가지 않도록 조정)
        currentQty = Math.max(currentQty - 1, 0);
        qtyValue.textContent = currentQty;

        // 총 결제금액 업데이트
        updateTotalPrice();
        openPriceDiv();
    });
});

// 서브밋 버튼 클릭 시
paymentBtn.addEventListener('click', (e) => {
	if (e.target.style.backgroundColor == "") {
		alert('구매 옵션을 선택해주세요');
	}
})

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
		
      const divElement = document.createElement("div");
      divElement.className = "popup-time";

      const buttonElement = document.createElement("button");
      buttonElement.textContent = t;

      divElement.appendChild(buttonElement);
      
      // Time 클릭 시, 색 변환 및 수량 open
      divElement.addEventListener('click', (e) => {
		  resetTimeDiv(); // 초기화
	       e.currentTarget.style.backgroundColor = '#46c8b4'; // 선택된 것만 색 변경    
	       if (e.currentTarget) {
	           openQtyDiv();
	       }
	  })
      popupTimeDiv.appendChild(divElement);
    }
  }  
  openTimeDiv();  
}

// 시간 선택 div open
function openTimeDiv() {
    resetTimeDiv(); // 오픈 시, 시간선택 초기화
    closeQtyDiv(); // 오픈 시, qty 닫힘 밑 초기화
    popupTimeDiv.style.display = 'flex';
}

// 시간 선택 초기화
function resetTimeDiv() {	
	const timeDiv = document.querySelectorAll('.popup-time');	
    timeDiv.forEach(function (element) {
        element.style.backgroundColor = '#f5f5f5';
    });
}

// 권종/수량 div open
function openQtyDiv() {
    closeQtyDiv();
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
        const price = parseInt(parent.querySelector('.popup-qty-price').textContent);
        const qty = parseInt(parent.querySelector('.qty-value').textContent);
        totalPrice += price * qty;
    });
    
    if (totalPrice > 0) {
		paymentBtn.style.backgroundColor = "#46c8b4";
	} else {
		paymentBtn.style.backgroundColor = "#b0b0b0";
	}
    // 총 결제금액 표시
    document.getElementById('popup-totalPrice-value').textContent = totalPrice;
}

// 선택한 qty, 총 결제금액 초기화
function resetQty() {
    qtyParents.forEach(function (parent) {
        parent.querySelector('.qty-value').textContent = 0;
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