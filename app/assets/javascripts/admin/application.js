// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
tinymce.init({
    selector: "textarea",
    plugins: ["autolink link image preview paste code wordcount textcolor table"],
    image_advtab: true,
    toolbar: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | forecolor backcolor table | bullist numlist outdent indent | link image | preview code",
    image_advtab: true,
	width : 815,
	menubar: false

});
