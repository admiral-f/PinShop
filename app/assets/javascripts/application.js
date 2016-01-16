// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function add_to_cart(id, title, price)
{
	var key = 'product_' + id;
	var x=window.localStorage.getItem(key);
	if(JSON.parse(x)==null){
		x=[id, title, price, 1];
		

	} else {
		x=JSON.parse(x);
		x[3]=x[3]*1+1;
	}
	window.localStorage.setItem(key, JSON.stringify(x));
	update_orders_link();
}

function update_orders_input()
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}

function update_orders_button()
{
	var text = 'Cart (' + cart_get_number_of_items() + ')';
	$('#orders_button').val(text);
}

function update_orders_link()
{
    var text = 'Cart (' + cart_get_number_of_items() + ')';
    $('#orders_link').html(text);
}

function cart_get_number_of_items()
{
	var cnt = 0;
	for(var i =0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);
		if(key.indexOf('product_')==0)
		{
			cnt = cnt + value*1;
		}
	}
	return cnt;
}

function cart_get_orders()
{
	var orders = '';
	for(var i =0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);
		if(key.indexOf('product_')==0)
		{
			orders= orders + key + '=' + value + ',';
		}
	}
	return orders;
}

