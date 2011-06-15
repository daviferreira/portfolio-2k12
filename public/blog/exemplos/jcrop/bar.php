<div id="topbar">
	<ul class="clearfix">
		<li>
			Escolha um exemplo:
			<select id="exemplo" name="exemplo">
				<option value=""></option>
				<option value="index.php">Exemplo 1 - cliente</option>
				<option value="crop-simples.php">Exemplo 2 - crop simples com PHP</option>
				<option value="crop-fixo.php">Exemplo 3 - crop fixo com PHP</option>
			</select>
		</li>
		<li class="voltar">
			<a href="http://www.daviferreira.com/blog/post/16/recortando-imagens-com-jcrop-e-php.html">ou volte para o artigo no blog</a>
		</li>
	</ul>
</div>
<script type="text/javascript">
$(function(){
	$('#exemplo').change(function(){
		if( $(this).val() )
		{
			window.location.href = $(this).val();
		}
	});
});
</script>