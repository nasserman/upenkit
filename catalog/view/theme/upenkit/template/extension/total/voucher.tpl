<li>
    <h4 class="uk-accordion-title"><?php echo $heading_title; ?></h4>
    <div class="uk-accordion-content">

        <div class="uk-margin">
            <div class="uk-inline uk-width-1-1">
                <button class="uk-form-icon uk-form-icon-flip" uk-icon="icon: refresh" type="button" value="<?php echo $button_voucher; ?>" id="button-voucher"></button>
                <input class="uk-input" type="text" name="voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" style="text-align:center;">
            </div>
        </div>


          <script type="text/javascript"><!--
    $('#button-voucher').on('click', function() {
      $.ajax({
        url: 'index.php?route=extension/total/voucher/voucher',
        type: 'post',
        data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
        dataType: 'json',
        beforeSend: function() {
          $('#button-voucher').attr("uk-icon", "icon: clock");
        },
        complete: function() {
          $('#button-voucher').attr("uk-icon", "icon: refresh");
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
