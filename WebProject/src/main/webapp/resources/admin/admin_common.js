// 탭 메뉴 이벤트 설정
function openrefund(evt, category) {
    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(category).style.display = "block";
    evt.currentTarget.className += " active";
}

// 초기화 버튼 스크립트

function resetForm() {
    // 체크박스 초기화
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = false;
    });

    // 텍스트 필드 초기화
    var textFields = document.querySelectorAll('input[type="text"]');
    textFields.forEach(function (textField) {
        textField.value = '';
    });

    // 날짜 필드 초기화
    var dateFields = document.querySelectorAll('input[type="date"]');
    dateFields.forEach(function (dateField) {
        dateField.value = '';
    });
}

// 체크박스 클릭 시 블록지정 

function changeBackgroundColor(checkbox) {
    var row = checkbox.parentNode.parentNode.parentNode; // <tr> 요소 선택
    var tds = row.getElementsByTagName('td'); // <td> 요소들 선택

    if (checkbox.checked) {
        for (var i = 0; i < tds.length; i++) {
            tds[i].style.backgroundColor = '#767678'; // 선택된 경우 배경 색상 변경
        }
    } else {
        for (var i = 0; i < tds.length; i++) {
            tds[i].style.backgroundColor = ''; // 선택이 해제된 경우 배경 색상 제거
        }
    }
}

// 검색 버튼 클릭 후 결과 테이블
function search() {
    // 검색 버튼 클릭 시 테이블 가시성 변경
    var tableContainer = document.getElementById("tableContainer");
    tableContainer.style.display = "block"; // 테이블 표시

    // 여기서 검색 로직을 추가할 수 있습니다.
    // 예를 들어 검색 결과를 테이블에 추가하는 코드 등을 작성할 수 있습니다.
}