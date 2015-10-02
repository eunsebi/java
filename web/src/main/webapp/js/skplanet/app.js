/**
 * This is necessary for examples file
 * Author: Kwak Nohyun (nhkwak@sk.com) , Junghyun Han (junghyun.han@sk.com)
 * Copyright (c) SK planet
 */

// 해당 변수에 값을 채워 주세요
$(function (){
    PlanetX.init({
        appkey : "4565f461-9b9a-3eac-ad20-17a6ce1dbc3f",
        client_id : "65836f7b-1600-35a7-933f-6c30ad0de6e4",
        scope : "tcloud,user",
        //redirect_uri : "http://localhost/sym/mnu/mpm/EgovMainMenuHome.do",
        // if true, token is saved cookie or localstorage
        savingToken : true
    });

    //var status = PlanetX.getLoginStatus();
    //$("#status1").html("Login Status : " + status );
    //PlanetX.api( "get", "http://apis.skplanetx.com/weather/current/hourly", "JSON", { "version" : 1, "city" : '경기', "county" : '평택시', "village" : '독곡동'},  weather_callback, failCallback );
    PlanetX.api( "get", "http://apis.skplanetx.com/weather/current/hourly", "JSON", { "version" : 1, "lat" : '37.0660675', "lon" : '127.0553398'},  weather_callback, failCallback );
});

function userProfileCallback( data ) {
    var titleEl,
        $targetEl;
    titleEl = "<h2> userProfile success </h2>" ;
    $targetEl = $("#profile");
    for ( var i in data.profile ) {
        if ( data.profile[i].hasOwnProperty ){
            titleEl += ( i + " : " + data.profile[i] + "<br>" );
        }
    }
    $targetEl.html( titleEl );
}
function userProfile() {
    PlanetX.api( "get", "https://apis.skplanetx.com/users/me/profile", "JSON", { },  userProfileCallback );
}
function loginStatus () {
    var status;
    status = PlanetX.getLoginStatus();
    $("#status2").html( "Login Status :" + status );
}
function tcloud ( ) {
    PlanetX.api( "get", "https://apis.skplanetx.com/tcloud/images","JSON", { "version" :1 }, tcloud_callback );
}
function tcloud_callback ( data ) {
    var imgElement = document.createElement("img");
    imgElement.src = data.meta.images.image[0].thumbnailUrl;
    //imgElement.setAttributeNode( imgAttr );
    $("#tcloud").html( data.meta.images.image[0].name +"<br>");
    $("#tcloud").append(imgElement);
}

function weather() {
	//PlanetX.api( "get", "http://apis.skplanetx.com/weather/current/hourly", "JSON", { "version" : 1, "city" : '경기', "county" : '평택시', "village" : '독곡동'},  weather_callback, failCallback );
	PlanetX.api( "get", "http://apis.skplanetx.com/weather/current/hourly", "JSON", { "version" : 1, "lat" : '37.0660675', "lon" : '127.0553398'},  weather_callback, failCallback );
}

function weather_callback ( data ) {
	//var getContextPath = request.contextPath;
    var weatherElement,
    	//tmp,
    	$targetEl;
    //imgElement.setAttributeNode( imgAttr );
    //weatherElement = "<h2> Weather </h2>";
    $targetEl = $("#weather");
    //weatherElement = "<p style='color: rgb(1, 64, 131); font-family: 'gulim','dotum','Arial', 'Verdana'; font-size: 20pt; font-weight: bold;'>지역 : " + data.weather.hourly[0].grid.city + "&nbsp;" + data.weather.hourly[0].grid.county+ "&nbsp;" + data.weather.hourly[0].grid.village + "</p>";
    weatherElement = "<p style='color: rgb(1, 64, 131); font-family: 'gulim','dotum','Arial', 'Verdana'; font-size: 20pt; font-weight: bold;'>지역 : " + data.weather.hourly[0].grid.county+ "&nbsp;" + data.weather.hourly[0].grid.village + "</p>";
    weatherElement += "발표시간 : " + data.weather.hourly[0].timeRelease + "<br>";
    weatherElement += "현재날씨 : " + data.weather.hourly[0].sky.name +"<br>";
    weatherElement += "현재기온 : " + data.weather.hourly[0].temperature.tc +"℃";
    //weatherElement += "날씨 : " + data.weather.hourly[0].sky.name +"<br>";
    //tmp = data.weather.hourly[0].sky.code;
    weatherElement +=  "<img src=/images/weather_icons/" +  data.weather.hourly[0].sky.code.substring(5,7)+".png" + " > ";
    //$("#weather").html( "지역 : " + data.weather.hourly[0].grid.city +"<br>");
    //$("#weather").append(weatherElement);
    $targetEl.html( weatherElement );
    
}

function failCallback( data ) {
	$("#weather").html( "Weather Error" );
	$("#weather").html( data.error.message );
	//$("#weather").append( data );
}
function melon () {
    PlanetX.api( "get", "http://apis.skplanetx.com/melon/melondj", "JSON", { "version" : 1 }, melon_callback );
}
function melon_callback ( data ) {
    var titleEl,
        $targetEl,
        playList;
    titleEl = "<h2> melon success </h2>" ;
    $targetEl = $("#melon");
    playList = data.melon.categories.category;
    for ( var i= 0; i < playList.length ; i++  ) {
        titleEl +=  "<img src=\"" + playList[1].categoryImagePath + "\" > " + playList[i].categoryName + "<br>";
    }
    $targetEl.html( titleEl );
}
function search_11st () {
    var keyword = document.getElementById("search11").keyword.value;
    PlanetX.api( "get", "http://apis.skplanetx.com/11st/common/products", "JSON", { "searchKeyword" : keyword }, search_11st_callback );
}
function search_11st_callback ( data ) {
    var titleEl,
        $targetEl;
    titleEl = "<h2> 11st success </h2>" ;
    $targetEl = $("#11st");
    productList = data.ProductSearchResponse.Products.Product;
    for ( var i= 0 ; i < productList.length ; i++  ) {
        titleEl +=  productList[1].ProductCode + " : " + productList[i].ProductName + "<br>";
    }
    $targetEl.html( titleEl );
}
function logout() {
    PlanetX.logout( function() {
        window.location.reload();
    });
}