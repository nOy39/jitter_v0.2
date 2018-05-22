
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

function validate_date(value)
{
    var arrD = value.split(".");
    arrD[1] -= 1;
    var d = new Date(arrD[2], arrD[1], arrD[0]);
    if ((d.getFullYear() == arrD[2]) && (d.getMonth() == arrD[1]) && (d.getDate() == arrD[0])) {
        return true;
    } else {
        alert("Введена некорректная дата!");
        return false;
    }
}
