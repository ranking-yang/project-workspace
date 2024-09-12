

const couponBtns = document.getElementsByClassName('coupon');
const parentElement = opener.document.getElementById('coupon-value');
const memberCouponCode = opener.document.getElementById('member-coupon-code');
const basePrice = opener.document.getElementsByClassName('base-price');
const paymentTotalPrice = opener.document.getElementById('payment-total-Price');

for (let index = 0; index < couponBtns.length; ++index) {
	couponBtns[index].addEventListener('click', (e) => {
		
		let discount = couponBtns[index].dataset.discountRate;
		
		let totalPrice = 0; 
		for (let i = 0; i < basePrice.length; ++i) {
			totalPrice += Number(basePrice[i].innerHTML);
		}
		
		
		if (discount == undefined) {
			discount = couponBtns[index].dataset.discountMoney;
			paymentTotalPrice.innerHTML = totalPrice - discount;
			if (paymentTotalPrice.innerHTML.startsWith('-')) paymentTotalPrice.innerHTML = 0;
			paymentTotalPrice.innerHTML += '원';
			parentElement.innerHTML = `${discount}원/${couponBtns[index].dataset.couponName}`;
		} else {
			paymentTotalPrice.innerHTML = totalPrice * (1 - discount);
			paymentTotalPrice.innerHTML += '원';
			parentElement.innerHTML = `${totalPrice * discount}원/${couponBtns[index].dataset.couponName}`;
		}
		memberCouponCode.value = `${couponBtns[index].dataset.memberCouponCode}`;
		
		self.close();
	})
}