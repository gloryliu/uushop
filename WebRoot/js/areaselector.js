//====================================================================================================
// 地区级联选择
// [作者博客] http://truly.cnblogs.com
// [更新日期] 2010-02-04
// [版 本 号] ver0.3
//====================================================================================================
var AreaSelectConfig = 
{
	selProvinceId:'selProvince',
	selCityId : "selCity",
    selAreaId : 'selArea',
    data : _ds_data,
    firstOptionText : "请选择",
    firstOptionValue: "-1"
	/*
    onProvinceChange:abc,
    onCityChange:abc,
    onAreaChange:abc
	*/
};
	
function gid(id){return document.getElementById(id);}
function resetOptions(domID, data, value){
	var G = gid(domID),H;
	G.options.length=0;
	if(data==null || data.length==0) return;
	G.options[0]=new Option(AreaSelectConfig.firstOptionText,AreaSelectConfig.firstOptionValue);
	var newOption;
	for(i=0;i<data.length;i++){H = data[i];
		newOption = new Option(H.name,H.id);
		if(H.id==value) newOption.selected=true;
		G.options[G.options.length]=newOption;
	}
}
function initProvince(ProvinceId,CityId, AreaId) {
	resetOptions(AreaSelectConfig.selProvinceId,AreaSelectConfig.data, ProvinceId);
	initCity(CityId, AreaId);
}
function initCity(CityId, AreaId){
	var index = gid(AreaSelectConfig.selProvinceId).selectedIndex;
	if(index <=0 ) {resetOptions(AreaSelectConfig.selCityId); return;}
	var data = AreaSelectConfig.data[index-1].city;
	resetOptions(AreaSelectConfig.selCityId,data, CityId);
	
	if(AreaId != null)
	    initArea(AreaId);
}
function initArea(AreaId){
	var index = gid(AreaSelectConfig.selCityId).selectedIndex;	
	if(index <= 0) return ;
	var data = AreaSelectConfig.data[gid(AreaSelectConfig.selProvinceId).selectedIndex-1].city[index-1].area;	
	resetOptions(AreaSelectConfig.selAreaId,data, AreaId);
}
function chgProvince(callback){
	resetOptions(AreaSelectConfig.selAreaId);
	initCity();	
	
	if( callback )
		callback.call(gid(AreaSelectConfig.selProvinceId));
}
function chgCity(callback){
	resetOptions(AreaSelectConfig.selAreaId);
	initArea();
	
	if( callback )
		callback.call(gid(AreaSelectConfig.selCityId));
}
// 以下为使用JQuery时的方法
function initAreaSelector(option){
	if(typeof (jQuery) != 'undefined'){
		option = option || {};
		$.extend(AreaSelectConfig, option);
		$("#" + AreaSelectConfig.selProvinceId).change(chgProvince);
		$("#" + AreaSelectConfig.selCityId).change(chgCity);
	}else{
		gid(AreaSelectConfig.selProvinceId).onchange=function(){chgProvince(AreaSelectConfig.onProvinceChange)};
		gid(AreaSelectConfig.selCityId).onchange=function(){chgCity(AreaSelectConfig.onCityChange)};
		if(AreaSelectConfig.onAreaChange)
			gid(AreaSelectConfig.selAreaId).onchange=AreaSelectConfig.onAreaChange;
	}
	initProvince(); // 初始化数据
}
function abc(){
	alert(this.selectedIndex);
}
