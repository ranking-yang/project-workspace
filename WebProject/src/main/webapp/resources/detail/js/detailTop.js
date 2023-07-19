const calendar = document.querySelector('.placeholder');
const timeBtns = document.querySelectorAll('.popup-time-btn');
const qtyParent = document.querySelectorAll('.popup-qty-parent');
let totalPrice = 0;

// flatpickr 캘린더 설정
flatpickr.localize(flatpickr.l10ns.ko);

calendar.flatpickr({
    local: 'ko',
    inline: true,
    showMonths: 1,
    minDate: "today",
    maxDate: (calendar.dataset.maxdate), // 최대날짜 yyyy-mm-dd
    onChange : function(selectDates, dateStr, calendar) {
        console.log(dateStr); // 선택한 날짜 yyyy-mm-dd
        document.querySelector('.popup-time-parent').style.display = 'flex';
        closeQtyDiv();
    }
});

// 시간 선택 시, 권종/수량 오픈
timeBtns.forEach(timeBtn => {
    timeBtn.addEventListener('click', (e) => {
        openQtyDiv();
    }); 
});

// 권종/수량 선택 시, 총 가격 및 결제하기 활성화
// plus, minus 버튼
qtyParent.forEach((qtydiv) => {
    const qtyValue = qtydiv.querySelector('.qty-value');
    const qtyPrice = parseInt(qtydiv.querySelector('.popup-qty-price').innerHTML);
    
    qtydiv.querySelector('.qty-plus').addEventListener('click', (e) => {
        let count = parseInt(qtyValue.innerHTML);
        if (count > 9) {
            alert('더이상 구매할 수 없습니다.');
        } else {
            qtyValue.innerHTML = count + 1;
            // 계산 다시 흑흑...
            totalPrice += qtyPrice * (count + 1);
            openPriceDiv();
        }
    });

    qtydiv.querySelector('.qty-minus').addEventListener('click', (e) => {
        let count = parseInt(qtyValue.innerHTML);
        if (count < 1) {
            alert('올바른 수량...');
        } else {
            qtyValue.innerHTML = count - 1;
            // 계산 다시 흑흑...
            totalPrice += qtyPrice * (count - 1);
            openPriceDiv();
        }
    });
});

// div 열고 닫고 함수
function openQtyDiv() {
    document.querySelector('.popup-qty').style.display = 'flex';
    qtyParent.forEach(a=>a.style.display = "grid");
}

function openPriceDiv() {
    document.getElementById('popup-totalPrice-value').value = totalPrice;
    document.querySelector('.popup-totalPrice').style.display = 'grid';
    document.querySelector('.popup-submit').style.backgroundColor = '#46c8b4';
}

function closeQtyDiv() {
    document.querySelector('.popup-qty').style.display = 'none';
    document.querySelectorAll('.popup-qty-value').forEach(a=>a.style.display = 'none');
    document.querySelector('.popup-totalPrice').style.display = 'none';
    document.querySelector('.popup-submit').style.backgroundColor = '#b0b0b0';
    totalPrice = 0;
}