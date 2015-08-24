$(document).ready(function() {

    $("#city-search").click(function() {
        Cookies.remove('city');
        window.location.assign("/laricahunter");
    });
    
    $("#home-link").click(function() {
        window.location.assign("/laricahunter");
    });

    $("#search-form").submit(function(eventObj) {
        var city_cookie = Cookies.get('city');
        $(this).append('<input type="hidden" name="city" value="'+city_cookie+'" /> ');
        return true;
    });

    var cookie = Cookies.get('city');
    if (!cookie) {
        bootbox.prompt({
            title: "Em qual cidade você está?",
            closeButton: false,
            size: "small",
            callback: function(result) {
                if (result === null || result == '') {
                    bootbox.alert({
                        size: 'small',
                        message: "Digite a cidade!",
                        callback: function() {
                            location.reload();
                        }
                    });
                }
                else {
                    Cookies.set('city', result);
                    window.location.assign("estabelecimento/list?city=" + result);
                }
            }
        });

        navigator.geolocation.getCurrentPosition(function(pos) {
            var geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
            geocoder.geocode({
                'latLng': latlng
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var result = results[0];
                    var city = "victor";
                    for (var i = 0, len = result.address_components.length; i < len; i++) {
                        var ac = result.address_components[i];
                        console.log(ac.types);
                        if (ac.types.indexOf("administrative_area_level_2") >= 0) {
                            city = ac.long_name;
                        }
                    }
                    $(".bootbox-input").val(city);
                }
                else {
                    console.log("geocoder nok");
                }
            });
        }, function(error) {
            console.log(error);
        });
    }
    else {
        $("#city-search").html("Cidade: " + cookie + ". Alterar?");
    }
});