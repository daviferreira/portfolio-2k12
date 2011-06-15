<?php
	header( 'Cache-Control: no-cache' );
	header( 'Content-type: application/xml; charset="utf-8"', true );

	//$con = mysql_connect( 'internal-db.s77682.gridserver.com', 'db77682', 'GhXt5MRk' ) ;
	//mysql_select_db( 'db77682_daviferreira', $con );

	$con = mysql_connect( 'localhost', 'root', 'root' );
	mysql_select_db( 'daviferreira', $con );
	mysql_query( 'SET NAMES utf8' );

	$cod_estados = mysql_real_escape_string( $_REQUEST['cod_estados'] );

	$cidades = array();

	$sql = "SELECT cod_cidades, nome
			FROM cidades
			WHERE estados_cod_estados=$cod_estados
			ORDER BY nome";
	$res = mysql_query( $sql );
	while ( $row = mysql_fetch_assoc( $res ) ) {
		$cidades[] = array(
			'cod_cidades'	=> $row['cod_cidades'],
			'nome'			=> $row['nome'],
		);
	}

	echo( json_encode( $cidades ) );
	exit;