$(function() {
return $("h2, h3, h4, h5, h6").each(function(i, el) {
var $el, icon, id;
$el = $(el);

id = $el.attr('id');
icon = '<span class="mega-octicon octicon-link"></span>';
if (id) {
  return $el.prepend($("<a />").addClass("header-link").attr("href", "#" + id).html(icon));
}
});
});
