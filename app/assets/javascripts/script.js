var drinks = [
    {"name":"pint", "cals":239, units:2.7}, 
    {"name":"halfpint", "cals":120, units:1.3},
    {"name":"bottle", "cals":139, units:1.6},
    {"name":"winelarge", "cals":255, units:3.3},
    {"name":"winestand", "cals":179, units:2.3},
    {"name":"winesmall", "cals":128, units:1.6},
    {"name":"shot", "cals":52, units:1},
    {"name":"mixer1", "cals":43, units:0},
    {"name":"mixer2", "cals":47, units:0},
    {"name":"alcopop", "cals":228, units:1.5}
];

user = {"weight":83,"gender":"male","targettime":1415516960000,"yo":"JAKEHODGES"};

function sendWarningYo()
{
  var http = new XMLHttpRequest();
  var url = "http://api.justyo.co/yo/";
  var params = "api_token=77b1fb1c-b11b-4321-8d20-8d57d28624ca&username=" + user.yo;
  http.open("POST", url, true);

  //Send the proper header information along with the request
  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  http.setRequestHeader("Content-length", params.length);
  http.setRequestHeader("Connection", "close");

  http.onreadystatechange = function() {//Call a function when the state changes.
      if(http.readyState == 4 && http.status == 200) {
          //alert(http.responseText);
      }
  }
  http.send(params);
}

function sendDangerYo()
{
  var http = new XMLHttpRequest();
  var url = "http://api.justyo.co/yo/";
  var params = "api_token=77b1fb1c-b11b-4321-8d20-8d57d28624ca&username=" + user.yo;
  http.open("POST", url, true);

  //Send the proper header information along with the request
  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  http.setRequestHeader("Content-length", params.length);
  http.setRequestHeader("Connection", "close");

  http.onreadystatechange = function() {//Call a function when the state changes.
      if(http.readyState == 4 && http.status == 200) {
          //alert(http.responseText);
      }
  }
  http.send(params);
}

function reCalc()
{
  var now = new Date();

  if (user.gender == "male")
  {
    var dr = 0.68;
  }
  else
  {
    var dr = 0.55;
  }

  var BAC = 0;
  var totalcalories = 0;

  for (i = 0; i < consumedDrinks.length; i++)
  {
    var units = $.map(drinks, function(obj, index) {
      if(obj.name == consumedDrinks[i].drink) {
        return obj.units;
      }
    })

    var calories = $.map(drinks, function(obj, index) {
      if(obj.name == consumedDrinks[i].drink) {
        return obj.cals;
      }
    })

    totalcalories += parseInt(calories);
    BAC += ((0.8*units)/(user.weight*dr));
  }

  BAC = BAC - 0.016*(now.getTime()-consumedDrinks[0].time)/3600000;

  var sobertime = (BAC/0.016)*3600000 + now.getTime();

  $('#sobertime').html(moment(sobertime).calendar());
  $('#calcount').html(totalcalories);

  if (sobertime + 7200000 < user.targettime)
  {
    $('#sobertime').removeClass('amber red');
    $('#sobertime').addClass('green');
  }
  else if ((sobertime < user.targettime) && (sobertime + 7200000 > user.targettime))
  {
    $('#sobertime').removeClass('green red');
    $('#sobertime').addClass('amber');
    sendWarningYo();
  }
  else if (sobertime > user.targettime)
  {
    $('#sobertime').removeClass('green amber');
    $('#sobertime').addClass('red'); 
    sendDangerYo();
  }
}

$(function() {

  $(".info").on("click", function(e){
    if ($("#footer").css("height") == "120px")
    {
      $("#footer").animate({height:"95%"},1000,function(){});
    }
    else 
    {
      $("#footer").animate({height:"120px"},1000,function(){});
    }
    $(".info2").toggleClass("glyphicon-chevron-down");
    $(".info2").toggleClass("glyphicon-chevron-up");
    // $("#footer").css("height","100%")
});

  $(".minus").on("click", function(e){

    var now = new Date();

    var consumedCountObj = $(this).parent().parent().find('.consumed-count');

    var consumedCount = $(consumedCountObj).html();

    if(consumedCount != 0){
      $(consumedCountObj).html(consumedCount-1);
      window.consumedDrinks.pop({
        drink: $(this).data('drinktype'),
        time: now.getTime()
      });
    }

  });

  $(".plus").on("click", function(e){

    var now = new Date();

    var consumedCountObj = $(this).parent().parent().find('.consumed-count');

    var consumedCount = $(consumedCountObj).html();

    $(consumedCountObj).html(parseInt(consumedCount)+1);

    var drinkType = $(this).data('drinktype');

    window.consumedDrinks.push({
      drink: $(this).data('drinktype'),
      time: now.getTime()
    });

    reCalc();
  });

});
