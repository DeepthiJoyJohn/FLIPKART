const loginBtn = document.getElementById('loginBtn');

loginBtn.addEventListener('click', openPopup);
function openPopup(event) {
  event.preventDefault();
  // The URL of the popup window (e.g., "popup.html")
  const popupURL = "loginpopup.cfm";

  // Optional settings for the popup window
  const popupSettings = "width=400,height=300,resizable=yes";

  // Open the popup window
  window.open(popupURL, "PopupWindow", popupSettings);
}
function delaydisplay(){
  alert("f");
}


