let input_search=document.getElementById("search_input");
let form_search=document.getElementById("search_form");
let recent_searchEl=document.querySelector(".recent_search");
let recentArray["mobile","phone"];
form_search.addEventListener("submit",(e)=>{
	e.preventDefault()
	recentArray.unshift(input_search.value);
	console.log(recentArray);
})
let recent_search_html='';
recentArray.forEach(el=>{
	recent_search_html+= `
		<div class="recent_list">
			<i class="fa fa-search" aria-hidden="true"></i>
			<p>${el}</p>
		</div>	
	`
})
recent_searchEl.innerHTML=recent_search_html;