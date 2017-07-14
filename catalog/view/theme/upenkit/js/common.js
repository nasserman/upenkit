$(document).ready(function() {
    /* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		var url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('#search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

    $('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('#search input[name=\'search\']').parent().find('button').trigger('click');
		}
	});
});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > a > div').html('loading');
			},
			complete: function() {
				$('#cart > a > div').html('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					UIkit.notification({
						message: "<span uk-icon='icon: check'></span> " + json['success'],
						status: 'success',
						pos: 'top-right',
						timeout: 5000
					});

					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart > a > div').html('<span id="cart-total"><i uk-icon="icon: cart;"></i> ' + json['total'] + '</span>');
					}, 100);

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > a > div').html('loading');
			},
			complete: function() {
				$('#cart > a > div').html('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > a > div').html('<span id="cart-total"><i uk-icon="icon: cart;"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > a > div').html('loading');
			},
			complete: function() {
				$('#cart > a > div').html('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > a > div').html('<span id="cart-total"><i uk-icon="icon: cart;"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > a > div').html('loading');
			},
			complete: function() {
				$('#cart > a > div').html('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > a > div').html('<span id="cart-total"><i uk-icon="icon: cart;"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					UIkit.notification({
						message: "<span uk-icon='icon: check'></span> " + json['success'],
						status: 'success',
						pos: 'top-right',
						timeout: 5000
					});
				}

				$('#wishlist-total span').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					UIkit.notification({
						message: "<span uk-icon='icon: check'></span> " + json['success'],
						status: 'success',
						pos: 'top-right',
						timeout: 5000
					});

					$('#compare-total').html(json['total']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}
