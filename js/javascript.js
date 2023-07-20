import {featureProductNav} from "../Data/featureProductNav.js"
import {imageSlider} from "../Data/ImageSlider.js"
let input_search=document.getElementById("search_input")
let form_search=document.getElementById("search_form")
let recent_searchEl=document.querySelector(".recent_search")
let recentArray=["mobile","phone"]
form_search.addEventListener("submit",(e)=>{
	e.preventDefault()
	recentArray.unshift(input_search.value) 
	console.log(recentArray);
	renderrecent()
})

function renderrecent(){
	let recent_search_html='';
	recentArray.forEach(el=>{
		recent_search_html+= `
			<div class="recent_list">
				<i class="fa fa-search"></i>
				<p>${el}</p>
			</div>	
			`
	})
	recent_searchEl.innerHTML=recent_search_html;
}
renderrecent()

/*****featured Product */
let featuredProduct_listEI=document.querySelector(".featureProducts_list")
let featuredProductHTML=''
featureProductNav.forEach(el=>{
	featuredProductHTML +=`
		<div class="featureProducts_item">
			<a href="${el.link}">
				<div class="featureProducts_image">
					<img src="${el.img}"/>
				</div>
				<p class="featureProducts_name">
					${el.name}
					${el.subNavigation ?`<i class="fa solid fa-angle-down featureProduct_icon_more"></i>`:""}
				</p>
			</a>
		</div>`
})

featuredProduct_listEI.innerHTML=featuredProductHTML;
/****Image Slider */
let imageSliderListEl=document.querySelector(".imageSliderList")
let imageSliderListHTML=''
imageSlider.forEach(el=>{
	imageSliderListHTML+=`<div class="imageSliderItem">
							<a href="${el.link}">
								<img src="${el.img}"/>
							</a>
						  </div>`
})
imageSliderListEl.innerHTML=imageSliderListHTML;
