fetch('Components/FeaturedProducts.cfc?method=getArrayOfStructures')
    .then(response => response.json())
    .then(data => {
		processData(data);
    })
    .catch(error => {
        console.error('Error:', error);
    });
function processData(data){
	export const featureProductNav = [data];
}

// export const featureProductNav = [
// 	{	
// 		id:"featureProductNav_1",
// 		img:"Images/items/grocery.png",
// 		name:"Grocery",
// 		link:"productlisting.cfm",
// 		subNavigation:false,
// 	},
// 	{	
// 		id:"featureProductNav_2",
// 		img:"Images/items/beauty.png",
// 		name:"Beauty",
// 		link:"https://www.flipkart.com/big-saving-day-june2023-store?fm=neo%2Fmerchandising&iid=M_b8b7204e-766d-4a26-9652-e293555c8f06_1_FBB4FBSRQIC6_MC.NMKLQFISEEWO&otracker=hp_rich_navigation_6_1.navigationCard.RICH_NAVIGATION_Beauty_NMKLQFISEEWO&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_6_L0_view-all&cid=NMKLQFISEEWO",
// 		subNavigation:true,
// 	},
// 	{
// 		id:"featureProductNav_3",
// 		img:"Images/items/topoffers.png",
// 		name:"Top Offers",
// 		link:"https://www.flipkart.com/offers-store?param=98574&fm=neo%2Fmerchandising&iid=M_e949da19-b411-447a-8714-3050abc8963d_1_FBB4FBSRQIC6_MC.6OPAW1HHJZFH&otracker=hp_rich_navigation_1_1.navigationCard.RICH_NAVIGATION_Top%2BOffers_6OPAW1HHJZFH&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_1_L0_view-all&cid=6OPAW1HHJZFH",
// 		subNavigation:true,
// 	},
// 	{
// 		id:"featureProductNav_4",
// 		img:"Images/items/mobandtab.png",
// 		name:"Mobiles & Tablets",
// 		link:"https://www.flipkart.com/mobile-phones-big-saving-days-july23-yrz39-store?fm=neo%2Fmerchandising&iid=M_440173c6-c3ea-4bf4-b716-0c73b4e3a074_1_FBB4FBSRQIC6_MC.BYIXDBQAWBHQ&otracker=hp_rich_navigation_2_1.navigationCard.RICH_NAVIGATION_Mobiles%2B%2526%2BTablets_BYIXDBQAWBHQ&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_2_L0_view-all&cid=BYIXDBQAWBHQ",
// 		subNavigation:true,
// 	},
// 	{
// 		id:"featureProductNav_5",
// 		img:"Images/items/electronins.png",
// 		name:"Electronics",
// 		link:"https://www.flipkart.com/big-saving-days-july-23-sale-store?fm=neo%2Fmerchandising&iid=M_59bb91de-bd19-4a48-bd70-4ded605ae6a2_1_FBB4FBSRQIC6_MC.8TVKUWT87M16&otracker=hp_rich_navigation_3_1.navigationCard.RICH_NAVIGATION_Electronics_8TVKUWT87M16&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_3_L0_view-all&cid=8TVKUWT87M16",
// 		subNavigation:true,
// 	},
// 	{
// 		id:"featureProductNav_6",
// 		img:"Images/items/tvandappliances.png",
// 		name:"TVs & Appliances",
// 		link:"https://www.flipkart.com/tv-and-appliances-big-savings-days-sale-store?fm=neo%2Fmerchandising&iid=M_2a9a7859-5542-4363-8a25-ee3ba32830cf_1_FBB4FBSRQIC6_MC.KCBBC8GGWR9V&otracker=hp_rich_navigation_4_1.navigationCard.RICH_NAVIGATION_TVs%2B%2526%2BAppliances_KCBBC8GGWR9V&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_4_L0_view-all&cid=KCBBC8GGWR9V",
// 		subNavigation:true,
// 	},
// 	{
// 		id:"featureProductNav_7",
// 		img:"Images/items/fashion.png",
// 		name:"Fashion",
// 		link:"https://www.flipkart.com/fashion-bsd-trendy-july23-sale-store?fm=neo%2Fmerchandising&iid=M_bb9e2fc1-4692-4121-b294-e87100bfc151_1_FBB4FBSRQIC6_MC.CPZ5PBSAJQKR&otracker=hp_rich_navigation_5_1.navigationCard.RICH_NAVIGATION_Fashion_CPZ5PBSAJQKR&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_5_L0_view-all&cid=CPZ5PBSAJQKR",
// 		subNavigation:true,
// 	},
// 	{
// 		id:"featureProductNav_8",
// 		img:"Images/items/homeandkitchen.png",
// 		name:"Home & Kitchen",
// 		link:"https://www.flipkart.com/bsd-sale-home-dec-22-store?fm=neo%2Fmerchandising&iid=M_55662dbe-6324-47e6-aec9-9ea106031099_1_FBB4FBSRQIC6_MC.IF1WVE47NIXO&otracker=hp_rich_navigation_7_1.navigationCard.RICH_NAVIGATION_Home%2B%2526%2BKitchen_IF1WVE47NIXO&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_7_L0_view-all&cid=IF1WVE47NIXO",
// 		subNavigation:true,
// 	},
// 	{
// 		id:"featureProductNav_9",
// 		img:"Images/items/furniture.png",
// 		name:"Furniture",
// 		link:"https://www.flipkart.com/furniture-big-saving-days1-store?fm=neo%2Fmerchandising&iid=M_675d3b2d-818b-470c-a2c9-bdb49f981a2b_1_FBB4FBSRQIC6_MC.DF4ISSCHXW05&otracker=hp_rich_navigation_8_1.navigationCard.RICH_NAVIGATION_Furniture_DF4ISSCHXW05&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_8_L0_view-all&cid=DF4ISSCHXW05",
// 		subNavigation:true,
// 	},
// 	{
// 		id:"featureProductNav_10",
// 		img:"Images/items/flights.png",
// 		name:"Flights",
// 		link:"https://www.flipkart.com/travel/flights?param=FKHPNavTravelBDSJul23&fm=neo%2Fmerchandising&iid=M_5bf6bea5-469e-4918-8381-d3b815fa3058_1_FBB4FBSRQIC6_MC.9ODHZCZ094O6&otracker=hp_rich_navigation_9_1.navigationCard.RICH_NAVIGATION_Flights_9ODHZCZ094O6&otracker1=hp_rich_navigation_PINNED_neo%2Fmerchandising_NA_NAV_EXPANDABLE_navigationCard_cc_9_L0_view-all&cid=9ODHZCZ094O6",
// 		subNavigation:true,
// 	}
// ]