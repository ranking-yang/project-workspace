const calendar = document.querySelector('.placeholder');
const popupTimeDiv = document.querySelector('.popup-time');
const qtyParents = document.querySelectorAll('.popup-qty-parent');
const plusBtns = document.querySelectorAll('.qty-plus');
const minusBtns = document.querySelectorAll('.qty-minus');
const submitBtn = document.querySelector('#popup-submit');

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

 const timeBtns = document.querySelectorAll('.popup-time-parent');
      
  // 시간 선택 시, 권종/수량 오픈 및 초기화
	timeBtns.forEach((timeBtn) => {
	    timeBtn.addEventListener('click', (e) => {
	        resetTimeDiv(); // 초기화
	        e.currentTarget.style.backgroundColor = '#46c8b4'; // 선택된 것만 색 변경    
	        if (e.currentTarget) {
	            openQtyDiv();
	        }
	    });
	});  

// 권종/수량 선택 시, 총 가격 및 결제하기 활성화
// plus, minus 버튼
plusBtns.forEach(function (button) {
    button.addEventListener('click', function () {
        let parent = this.parentNode;
        let qtyValue = parent.querySelector('.qty-value');
        let currentQty = parseInt(qtyValue.textContent);

        // 수량 증가 (10이상 불가)
        if (currentQty < 10) {
            currentQty++;
            qtyValue.textContent = currentQty;
        } else {
            alert('더이상 티켓 구매가 불가능합니다.');
        }

        // 총 결제금액 업데이트
        updateTotalPrice();
        openPriceDiv();
    });
});

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

// 시간 선택 div open
function openTimeDiv() {
    resetTimeDiv(); // 오픈 시, 시간선택 초기화
    closeQtyDiv(); // 오픈 시, qty 닫힘 밑 초기화
    popupTimeDiv.style.display = 'flex';
}

// 권종/수량 div open
function openQtyDiv() {
    closeQtyDiv();
	document.querySelector('.popup-qty').style.display = "grid";
    
    // 연령 체크해서 qty 표출
	const age = chkAge();
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

// 시간 선택 초기화
function resetTimeDiv() {
    timeBtns.forEach(function (element) {
        element.style.backgroundColor = '#f5f5f5';
    });
}

// 선택한 qty, 총 결제금액 초기화
function resetQty() {
    qtyParents.forEach(function (parent) {
        parent.querySelector('.qty-value').textContent = 0;
    });    
    document.getElementById('popup-totalPrice-value').value = 0;
    submitBtn.disabled = true;
}

// 총 금액 계산
function updateTotalPrice() {
    let totalPrice = 0;

    // 각 권종별로 총 가격 계산
    qtyParents.forEach(function (parent) {
        const price = parseInt(parent.querySelector('.popup-qty-price').textContent);
        const qty = parseInt(parent.querySelector('.qty-value').textContent);
        totalPrice += price * qty;
    });
    if (totalPrice > 0) {
        submitBtn.disabled = false;
    } else {
        submitBtn.disabled = true;
    }
    // 총 결제금액 표시
    document.getElementById('popup-totalPrice-value').value = totalPrice;
}

// 날짜 계산
function chkStartDate(startdate) {
	const date = new Date(startdate);	
	if (date < "today") {
		date = "today";
	}	
	return date;
}

// 연령 계산
function chkAge() {	
	const age = document.querySelector('#detail-top-age').textContent;	
	if (age.includes('만')) {
		return age.substring(age.indexOf(' '), age.indexOf('세'));
	} else {
		return 0;
	}
}

function showTimeTable(date) {
  const timeArray = timetable[date];

  // 이전에 표시된 내용이 있다면 삭제
  popupTimeDiv.innerHTML = "";

  for (const time of timeArray) {
    const timeParts = time.split(",");
    for (const t of timeParts) {
      const divElement = document.createElement("div");
      divElement.className = "popup-time-parent";

      const inputElement = document.createElement("input");
      inputElement.type = "button";
      inputElement.name = "time";
      inputElement.value = t.trim();

      const ticketElement = document.createElement("div");
      ticketElement.textContent = "[남은 티켓: 1개]";

      divElement.appendChild(inputElement);
      divElement.appendChild(ticketElement);   

      popupTimeDiv.appendChild(divElement);
    }
  }
  openTimeDiv();
}