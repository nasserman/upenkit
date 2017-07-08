<?php if (count($currencies) > 1) { ?>


<li>

    <a href="#">
        <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
            <strong><?php echo $currency['symbol_left']; ?></strong>
            <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
            <strong><?php echo $currency['symbol_right']; ?></strong>
            <?php } ?>
        <?php } ?>
        <?php echo $text_currency; ?>
    </a>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency" class="uk-navbar-dropdown">

        <ul class="uk-nav uk-navbar-dropdown-nav">
          <?php foreach ($currencies as $currency) { ?>
              <?php if ($currency['symbol_left']) { ?>
              <li><a class="currency-select" href="#" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a></li>
              <?php } else { ?>
              <li><a class="currency-select" href="#" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a></li>
              <?php } ?>
          <?php } ?>
        </ul>




      <input type="hidden" name="code" value="" />
      <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
</li>
<?php } ?>
