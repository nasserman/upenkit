<li>
    <h4 class="uk-accordion-title">
        <?php echo $heading_title; ?>
    </h4>
    <div class="uk-accordion-content">

        <div class="uk-margin">
            <div class="uk-inline uk-width-1-1">
                <button class="uk-form-icon uk-form-icon-flip" uk-icon="icon: refresh" type="button" value="<?php echo $button_coupon; ?>" id="button-coupon"></button>
                <input class="uk-input" type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" style="text-align:center;">
            </div>
        </div>


        <script type="text/javascript"><!--
  $('#button-coupon').on('click', function() {
    $.ajax({
        url: 'index.php?route=extension/total/coupon/coupon',
        type: 'post',
        data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
        dataType: 'json',
        beforeSend: function() {
            $('#button-coupon').attr("uk-icon", "icon: clock");
        },
        complete: function() {
            $('#button-coupon').attr("uk-icon", "icon: refresh");
        },
        success: function(json) {
            $('.uk-alert').remove();

            if (json['error']) {
                $('.uk-breadcrumb').after('<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><span uk-icon="icon: info"></span> ' + json['error'] + '</div>');

                $('html, body').animate({ scrollTop: 0 }, 'slow');
            }

            if (json['redirect']) {
                location = json['redirect'];
            }
        }
    });
  });
  //--></script>

    </div>
</li>
