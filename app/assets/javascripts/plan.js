"use strict";
var getMap = (function() {
  function codeAddress(address) {
    // Geocoderコンストラクタのインスタンスを生成
    var geocoder = new google.maps.Geocoder();

    // 地図の初期設定
    var mapOptions = {
      zoom: 16,
      center: { lat: 35.662, lng: 139.703 },
      mapTypeId: "roadmap"
    };

    // ビューのmap領域に上記の設定で地図を表示
    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    console.log(map);

    //マーカー変数を宣言
    var marker;
    let latlng;
    // コンストラクタからgeocodeを実行
    geocoder.geocode({ address: address }, function(results, status) {
      // 成功時
      if (status === "OK") {
        // 緯度経度情報から該当の場所を地図の中心に表示
        map.setCenter(results[0].geometry.location);

        // マーカーの位置を指定するための、変数
        // 緯度経度情報の配列を代入
        latlng = results[0].geometry.location;
        marker = new google.maps.Marker({
          // マーカーを追加
          position: latlng, // 位置を指定
          map: map // 地図を指定
        });

        // 地点の標高情報を取得
        function getElevation(latlng) {
          // 要素が１つでも配列に…。
          var locations = [latlng];

          // ElevationServiceのコンストラクタを生成
          var elevation = new google.maps.ElevationService();

          // リクエストを発行
          elevation.getElevationForLocations(
            {
              locations: locations
            },
            function(results, status) {
              if (status === "OK") {
                if (results[0].elevation) {
                  // ビューで標高情報を表示する
                  // 宣言した変数に取得した標高情報を代入
                  var elevation = results[0].elevation;
                  console.log(elevation);
                  //小数点を切り捨てた値を、elevに表示
                  document.getElementById("elev").value = Math.floor(elevation);
                }
              } else {
                alert("標高情報を取得できませんでした");
              }
            }
          );
        }
        //標高情報の取得、ビューでの表示を実行
        getElevation(latlng);

        // ジオコーディングが成功しなかった場合
      } else {
        console.log(
          "Geocode was not successful for the following reason: " + status
        );
      }
    });

    // 地図をクリックで位置変更
    map.addListener("click", function(e) {
      getClickLatLng(e.latLng, map);
    });
    function getClickLatLng(latlng, map) {
      map.panTo(latlng);
    }
  }

  //inputのvalueで検索して地図を表示
  return {
    getAddress: function() {
      // 検索ボタンに指定したid要素を取得
      var button = document.getElementById("map_button");
      // 検索ボタンが押された時の処理
      button.addListener("click", function(e) {
        // フォームの入力住所情報を取得
        var address = document.getElementById("address").value;
        // 上記の住所を引数としてcodeAddress関数を実行
        codeAddress(address);
      });

      //読み込まれたときに地図を表示
      window.onload = function() {
        // フォームに入力された住所情報を取得
        var address = document.getElementById("address").value;
        // 上記の住所を引数としてcodeAddress関数を実行
        codeAddress(address);
      };
    }
  };
})();
getMap.getAddress();

$(document).ready(function() {
  // 入力フォームを取得して、同名の変数に自動補完機能を付与
  var from_places = new google.maps.places.Autocomplete(
    // 出発地
    document.getElementById("from_places")
  );
  var to_places = new google.maps.places.Autocomplete(
    // 避難先
    document.getElementById("to_places")
  );
  // 自動補完された情報を入力フォームに表示
  google.maps.event.addListener(from_places, "place_changed", function() {
    var from_place = from_places.getPlace();
    var from_address = from_place.formatted_address;
    $("#origin").val(from_address);
  });
  google.maps.event.addListener(to_places, "place_changed", function() {
    var to_place = to_places.getPlace();
    var to_address = to_place.formatted_address;
    $("#destination").val(to_address);
  });

  let departure;
  let shelter;
  let distance;
  let duration;

  // 距離と時間を計算する関数を定義
  function calculateDistance() {
    //変数を宣言し、出発地、避難先の情報を代入
    var origin = $("#origin").val();
    var destination = $("#destination").val();
    // Directionsに対して、2地点間のルート表示に必要な値を渡す
    var directionService = new google.maps.DirectionsService();
    directionService.route(
      {
        origin: origin,
        destination: destination,
        travelMode: google.maps.TravelMode.WALKING
      },
      callback
    );
  }

  function callback(response, status) {
    if (status != google.maps.DirectionsStatus.OK) {
      $("#result").html(err);
    } else {
      if (status === "ZERO_RESULTS") {
        $("#result").html(
          "Better get on a plane. There are no roads between " +
            departure +
            " and " +
            shelter
        );
      } else {
        var map = new google.maps.Map(document.getElementById("map"));
        var directionsRenderer = new google.maps.DirectionsRenderer();
        directionsRenderer.setMap(map);
        directionsRenderer.setDirections(response);
        var legs = response.routes[0].legs;
        console.log(legs);
        distance = legs[0].distance.value;
        duration = legs[0].duration;
        departure = legs[0].start_address;
        shelter = legs[0].end_address;
        $("#in_meter").text(distance.toFixed(2));
        $("#duration_text").text(duration.text);
        $("#from").text(departure);
        $("#to").text(shelter);
      }
    }
  }

  // 2地点間の距離と時間を計算する
  $("#distance_form").submit(function(e) {
    e.preventDefault();
    calculateDistance();
  });
  // Ajaxを用いて、distanceMatrixで得られた情報を保存する
  $(".registration").click(function(_e) {
    console.log("登録ボタンが押されました");
    let user_id = $(".current_user_id").val();
    $.ajax({
      type: "POST",
      url: "/plans",
      data: {
        plan: {
          user_id: user_id,
          departure: departure,
          shelter: shelter,
          distance: distance,
          duration: duration.value
        }
      },
      datatype: "json"
    })
      .done(function(data) {
        window.location = "<%= plan_path(current_user.id) %>";
      })
      .fail(function() {
        alert("登録に失敗しました");
      });
  });
});
