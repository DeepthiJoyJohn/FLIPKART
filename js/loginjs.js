const loginBtn = document.getElementById('loginBtn');
const loginPopup = document.getElementById('loginPopup');

loginBtn.addEventListener('click', () => {
  loginPopup.style.display = 'block';
});

function closePopup() {
  loginPopup.style.display = 'none';
}