/*
	função para substituir o alert PAM! do JS
*/


// timer para o timeout do javascript
var msgTimer = '';

// tempo padrão para msgTopo
var tempoPadrao = 5000;

// função simples para exibir resposta de erro ou confirmação
var msgTopo = function(txt,classe,tempo) {
	// limpa timeout
	clearTimeout(msgTimer);

    if( $('#msg-topo').length == 0 )
    {
        $('body').prepend( '<div><div id="msg-topo"></div></div><div><div id="overlay"></div></div>' );
    }

    // exibe msg
	if (classe == 'erro') {
		$('#msg-topo').removeClass('msg');
	} else {
		$('#msg-topo').removeClass('erro');
	}
	$('#msg-topo').addClass(classe);
	
	// hack para IE6 já que não aceita fixed...
	if ($.browser.msie == true) {
		if( $.browser.version < 7 )
		{
			$('#msg-topo').css('top', $(window).scrollTop());
		}
	}
	
	$('#msg-topo').html(txt);
	$('#msg-topo').slideDown('fast');
	$('#msg-topo').click(function(){hideMsgTopo();return false;});
    msgTimer = setTimeout("hideMsgTopo();", tempo);
}; // fim msgTopo

var hideMsgTopo = function() {
	clearTimeout(msgTimer);
	$('#msg-topo').fadeOut('fast');
};
