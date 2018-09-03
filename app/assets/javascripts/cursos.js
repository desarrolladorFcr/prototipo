//= require jquery/dist/jquery.min.js
var curso_form ={
    INICIO:function(){
      curso_form.EVENTOS();
    },
    EVENTOS:function(){
      $("#btn_curso").on("click", curso_form.LOGICA.enviar);
    },
    LOGICA:{
      enviar:function(){
          $("#err_prop").html('');
          existImg = $("#exist_img").val();
          valida = true;

          if(typeof existImg == "undefined"){
              img = $("#curso_imagen").val();
              if(img.length == 0){
                valida = false;
                msj = 'El curso debe de tener una imagen descriptiva';
              }
          }

          if($("#curso_certificable").prop('checked')){
              prof = $("#prof").val();
              if(prof == '0'){
                valida = false;
                msj = "Si el curso es certificable, debe de tener un profesor encargado"
              }
          }

          if(valida == true){
            $("#form_c").trigger("submit")
          }else{
            $("#error_explanation").empty();
            $("#err_prop").html(msj);
          }
      }
    }
}

$(document).ready(function(){
    if($("#curso_form").length > 0){
      curso_form.INICIO();
    }
})
