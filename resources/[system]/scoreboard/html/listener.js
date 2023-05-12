$(function()
{
    window.addEventListener('message', function(event)
    {
        var item = event.data;
        var buf = $('#wrap');
        buf.find('table').append("<tr class=\"heading\"><th>ID</th><th style=\"border-left:1px solid #000000;\">Name</th></tr>");
        if (item.meta && item.meta == 'close')
        {
            document.getElementById("ptbl").innerHTML = "";
            $('#wrap').hide();
            return;
        }
		document.getElementById("ptbl").innerHTML = "<tr class=\"heading\"><td style=\"width:20px;padding:7px; border-radius:10px; background: rgba(80, 20, 20,0.8); color: #fff; text-align:center;\">Gracz</td><td style=\"width:20px;padding:7px; background: rgba(80, 10, 10,0.8); color: #fff; text-align:center;\">ID</td></tr>" +  item.text + "";
        $('#wrap').show();
    }, false);
});