(function($){
    $.getScriptWithCache = function(url, callback) {
        $.ajax({
            type: 'GET',
            url: url,
            success: callback,
            dataType: 'script',
            cache: true
        });
    };
}(this.jQuery));