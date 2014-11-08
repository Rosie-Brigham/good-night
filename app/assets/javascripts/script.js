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

user = {"weight":83,"gender":"male"};

function calcSober()
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

  for (i = 0; i < consumedDrinks.length; i++)
  {
    var units = $.map(drinks, function(obj, index) {
    if(obj.name == consumedDrinks[i].drink) {
        return obj.units;
    }
  })

    BAC += ((0.8*units)/(user.weight*dr));
  }

  BAC = BAC - 0.016*(now.getTime()-consumedDrinks[0].time)/3600000;

  var sobertime = (BAC/0.016)*3600000 + now.getTime();

  $('#sobertime').html(moment(sobertime).format("dddd HH:mm"));
}

$(function() {

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

    calcSober();
  });

});
