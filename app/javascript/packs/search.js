document.addEventListener("turbolinks:load", function() {
    $input = $("[data-behavior='autocomplete']")

    var options = {
        url: function(phrase) {
            return "/search.json?q=" + phrase;
        },
        getValue: "title",
        list: {
        onChooseEvent: function() {
            var url = $input.getSelectedItemData().url
            $input.val("")
            Turbolinks.visit(url)
        }
        }
    }
    $input.easyAutocomplete(options)
});