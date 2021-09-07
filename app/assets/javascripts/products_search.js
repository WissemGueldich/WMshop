$(document).ready(function(){
    $("#products-search #term").on("keyup", function(){
      var jqxhr = $.get(
        $("#products-search").attr("action"),
        {term: $("#products-search #term").val()},
        function(){
          var result = $("#products-result").html();
          if(!result){
            $("#products-search #term").popover({
              content: "No result found.",
              placement: "bottom",
              html: true,
              trigger: "focus"
            });
          } else {
            $("#products-search #term").popover({
              content: $("#products-result"),
              placement: "bottom",
              html: true,
              trigger: "focus"
            });
          }
          $("#products-search #term").popover("show");
        }
      )
    })
  });