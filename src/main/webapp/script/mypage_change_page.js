info_change_b();
function info_change_b() {
	document.getElementById('info_change').style.backgroundColor="#fbd6bc";
	document.getElementById('trade_log').style.backgroundColor="#fbf1e2";
	document.getElementById('info_page_load').style.display="block";
	document.getElementById('trade_page_load').style.display="none";
	document.getElementById('info_page_edit').style.display="none";
}

function trade_log_b() {
	document.getElementById('trade_log').style.backgroundColor="#fbd6bc";
	document.getElementById('info_change').style.backgroundColor="#fbf1e2";
	document.getElementById('info_page_load').style.display="none";
	document.getElementById('trade_page_load').style.display="block";
	document.getElementById('info_page_edit').style.display="none";
}

function info_change_edit() {
	document.getElementById('info_change').style.backgroundColor="#fbd6bc";
	document.getElementById('trade_log').style.backgroundColor="#fbf1e2";
	document.getElementById('info_page_load').style.display="none";
	document.getElementById('trade_page_load').style.display="none";
	document.getElementById('info_page_edit').style.display="block";
}
