$(function() {

  $(".minus").on("click", function(e){

    var now = new Date();

    var consumedCountObj = $(this).parent().parent().find('.consumed-count');

    var consumedCount = $(consumedCountObj).html();

    if(consumedCount != 0){
      $(consumedCountObj).html(consumedCount-1);
      window.consumedDrinks.pint.pop({
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

    window.consumedDrinks.pint.push({
      drink: $(this).data('drinktype'),
      time: now.getTime()
    });

  });

});
