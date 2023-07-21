const policy_refundBtn = document.getElementById('policy-refund-btn');
const policy_clauseBtn = document.getElementById('policy-clause-btn');

policy_refundBtn.addEventListener('click', (e) => {
    document.getElementById('policy-refund-txt').classList.toggle('show');
});

policy_clauseBtn.addEventListener('click', (e) => {
    document.getElementById('policy-clause-txt').classList.toggle('show');
});