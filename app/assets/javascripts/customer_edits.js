$( document ).ready(function() {
$('#copy_shipping').click(function() {
    var $this = $(this);
    // $this will contain a reference to the checkbox   
    if ($this.is(':checked')) {
        // the checkbox was checked 
        var address1 = $("#customer_shipping_address_sh_address1").val();
        $("#customer_billing_address_bi_address1").val(address1);
        var address2 = $("#customer_shipping_address_sh_address2").val();
        $("#customer_billing_address_bi_address2").val(address2);
        var city = $("#customer_shipping_address_sh_city").val();
        $("#customer_billing_address_bi_city").val(city);
        var state = $("#customer_shipping_address_sh_state").val();
        $("#customer_billing_address_bi_state").val(state);
        var zipcode = $("#customer_shipping_address_sh_zipcode").val();
        $("#customer_billing_address_bi_zipcode").val(zipcode);
    } else {
        // the checkbox was unchecked
        $("#customer_billing_address_bi_address1").val('');
        $("#customer_billing_address_bi_address2").val('');
        $("#customer_billing_address_bi_city").val('');
        $("#customer_billing_address_bi_state").val('');
        $("#customer_billing_address_bi_zipcode").val('');
    }
});

$("div[id^='asset-toolbar-options']").each(function(i) {
var theID = $(this).attr('id');
    $(this).prev('a').toolbar({
    content: '#' + theID,
    position: 'top',
    hideOnClick: 'true',
    zIndex: 99
});
});

$('input[id=asset_file_name]').change(function() {
    $('#assetCover').val($(this).val().replace('C:\\fakepath\\', ''));
});

$('.assetColumn').last().addClass('end');

  $("#sh_addresses_0").change(function(){
    var id = $(this).children(":selected").val();
    if(id == "") {
        $("#e_shipping_addresses").html("")
    } else {
    var params = 'sh_addr_id=' + id;
    $.ajax({
      url: "/get_sh_address",
      data: params
    })
}
});

  $("#bi_addresses_0").change(function(){
    var id2 = $(this).children(":selected").val();
    if(id2 == "") {
        $("#e_billing_addresses").html("")
    } else {
    var params2 = 'bi_addr_id=' + id2;
    $.ajax({
      url: "/get_bi_address",
      data: params2
    })
}
});  


});