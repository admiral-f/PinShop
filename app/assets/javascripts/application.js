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

function update_order_price_input()
{
	var price = cart_total_price();
	$('#order_price').val(price);
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
		value=JSON.parse(value);
		if(key.indexOf('product_')==0)
		{
			cnt = cnt + value[3]*1;
		}
	}
	return cnt;
}

function cart_total_price()
{
	var total_price = 0;
	for(var i =0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);
		value=JSON.parse(value);
		if(key.indexOf('product_')==0)
		{
			total_price=total_price*1+value[2]*value[3];
		}
	}
	return total_price;
}

function cart_get_orders()
{
	var orders = '';
	for(var i =0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);
		value=JSON.parse(value);
		if(key.indexOf('product_')==0)
		{
			orders= orders + key + '=' + value[3] + ',';
		}
	}
	return orders;
}

function add_order_table()
{
	if (cart_get_number_of_items()==0){
		var table = document.getElementById("OrdersTable");
	    var header = table.createTHead();
	    var row = header.insertRow(0);
	    var cell1 = row.insertCell(0);
	    cell1.innerHTML = "<b>Empty cart</b>";
	    document.getElementById("order_button").disabled = true;
	} else {
		document.getElementById("order_button").disabled = false;
		var table = document.getElementById("OrdersTable");
	    var header = table.createTHead();
	    var row = header.insertRow(0);
	    var cell1 = row.insertCell(0);
	    var cell2 = row.insertCell(1);
	    var cell3 = row.insertCell(2);
	    var cell4 = row.insertCell(3);
	    var cell5 = row.insertCell(4);
	    cell1.innerHTML = "<b>#</b>";
	    cell2.innerHTML = "<b>Pin</b>";
	    cell3.innerHTML = "<b>Price</b>";
	    cell4.innerHTML = "<b>Quantity</b>";
	    cell5.innerHTML = "<b>Sum Price</b>";
	    for(var i =0; i < window.localStorage.length; i++)
		{
			var key = window.localStorage.key(i);
			var value = window.localStorage.getItem(key);
			value=JSON.parse(value);
			if(key.indexOf('product_')==0)
			{
				var row = table.insertRow(i+1);
				var cell1 = row.insertCell(0);
	    		var cell2 = row.insertCell(1);
	    		var cell3 = row.insertCell(2);
	    		var cell4 = row.insertCell(3);
	    		var cell5 = row.insertCell(4);
	    		cell1.innerHTML = '<b>' + (i+1) + '</b>';
	    		cell2.innerHTML = '<a href="/pins/'+value[0]+'">'+value[1]+'</a>';
	    		cell3.innerHTML = value[2] + ' $';
	    		cell4.innerHTML = '<span class="glyphicon glyphicon-minus-sign" onclick="decrease_quantity(' +value[0]+ ')"></span> ' +value[3]+ ' <span class="glyphicon glyphicon-plus-sign" onclick="increase_quantity('+value[0]+')"></span>';
	    		cell5.innerHTML = value[2]*value[3] +' $  ' + '<span class="glyphicon glyphicon-trash" onclick="delete_product('+value[0]+')"></span> ';
	    	}
		}
		var row = table.insertRow();
		var cell1 = row.insertCell(0);
	    var cell2 = row.insertCell(1);
	    var cell3 = row.insertCell(2);
	    var cell4 = row.insertCell(3);
	    var cell5 = row.insertCell(4);
	    cell1.innerHTML = "";
	    cell2.innerHTML = "";
	    cell3.innerHTML = "";
	    cell4.innerHTML = "Total Quantity: " + cart_get_number_of_items();
	    cell5.innerHTML = "Total price: " + cart_total_price() + ' $';
	}
} 

function decrease_quantity(id)
{
	var key = 'product_' + id;
	var x=window.localStorage.getItem(key);
	x=JSON.parse(x);
	if(x[3]==0){
		localStorage.removeItem(key);
	} else{
		x[3]=x[3]*1-1;
		window.localStorage.setItem(key, JSON.stringify(x));
	}
	location.reload();
}

function increase_quantity(id)
{
	var key = 'product_' + id;
	var x=window.localStorage.getItem(key);
	x=JSON.parse(x);
	x[3]=x[3]*1+1;
	window.localStorage.setItem(key, JSON.stringify(x));
	location.reload();
}

function delete_product(id)
{
	var key = 'product_' + id;
	localStorage.removeItem(key);
	location.reload();
}

function cancel_order()
{
	
	window.localStorage.clear();
	update_orders_link();
	update_orders_input();
	update_order_price_input();
}