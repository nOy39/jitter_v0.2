
$(function(){
    $("a.poster").click(function() { // все ссылки с классом .poster
        var value = $(this).attr("value"); // поле value
        var href = $(this).attr("/notes"); // поле href - адрес, куда посылать
        $.POST( href, {value: value}, function(data) { // посылаем
            alert( data );
        });
        return false;
    });
});
