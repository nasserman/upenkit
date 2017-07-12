<?php echo $header; ?>
<div class="uk-container">
  <?php include_once("catalog/view/theme/upenkit/template/parts/breadcrumb.tpl"); ?>
  <?php if ($attention) { ?>
  <div class="uk-alert-info" uk-alert>
      <a class="uk-alert-close" uk-close></a>
      <span uk-icon="icon: info"></span> <?php echo $attention; ?>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="uk-alert-success" uk-alert>
      <a class="uk-alert-close" uk-close></a>
      <span uk-icon="icon: check"></span> <?php echo $success; ?>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="uk-alert-danger" uk-alert>
      <a class="uk-alert-close" uk-close></a>
      <span uk-icon="icon: warning"></span> <?php echo $error_warning; ?>
  </div>
  <?php } ?>
  <div uk-grid>
      <?php include_once("catalog/view/theme/upenkit/template/parts/main_content_div.php"); ?>
      <?php echo $content_top; ?>
      <h3><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h3>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="uk-overflow-auto">
          <table class="uk-table uk-table-divider uk-table-middle uk-table-small">
            <thead>
              <tr>
                <th class="uk-text-nowrap"><?php echo $column_image; ?></th>
                <th class="uk-text-nowrap"><?php echo $column_name; ?></th>
                <th class="uk-text-nowrap"><?php echo $column_model; ?></th>
                <th class="uk-text-nowrap"><?php echo $column_quantity; ?></th>
                <th class="uk-text-nowrap"><?php echo $column_price; ?></th>
                <th class="uk-text-nowrap"><?php echo $column_total; ?></th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="uk-preserve-width uk-border-circle" />
                  </a>
                  <?php } ?></td>
                <td>
                    <?php if (!$product['stock']) { ?>
                    <div class="uk-alert-danger" uk-alert>
                    <?php } ?>

                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <?php if ($product['option']) { ?>
                    <?php foreach ($product['option'] as $option) { ?>
                    <br />
                    <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                    <?php } ?>
                    <?php } ?>

                    <?php if ($product['reward']) { ?>
                    <br />
                    <small><?php echo $product['reward']; ?></small>
                    <?php } ?>

                    <?php if ($product['recurring']) { ?>
                    <br />
                    <span class="uk-label uk-label-success"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                    <?php } ?>


                    <?php if (!$product['stock']) { ?>
                     *** </div>
                    <?php } ?>
                </td>
                <td class="uk-table-shrink uk-text-nowrap"><?php echo $product['model']; ?></td>
                <td>
                    <div class="uk-inline">
                        <button type="button"  title="<?php echo $button_remove; ?>" class="uk-form-icon" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" uk-icon="icon: trash"></button>
                        <button type="submit" title="<?php echo $button_update; ?>" class="uk-form-icon" style="margin-left:30px;" uk-icon="icon: refresh"></button>
                        <input type="number" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="uk-input uk-form-width-small" style="padding-left:70px;" />
                    </div>
                </td>
                <td class="text-right"><?php echo $product['price']; ?></td>
                <td class="text-right"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>

      <div class="uk-grid-divider uk-child-width-1-2@s uk-margin-large-top" uk-grid>

          <div>
              <div class="uk-card uk-card-default uk-card-body">
                <table class="table table-bordered">
                  <?php foreach ($totals as $total) { ?>
                  <tr>
                    <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                    <td class="text-right"><?php echo $total['text']; ?></td>
                  </tr>
                  <?php } ?>
                </table>
              </div>
          </div>

          <?php if ($modules) { ?>
          <div>
              <div class="uk-card uk-card-default uk-card-body">
                  <h3><?php echo $text_next; ?></h3>
                  <p><?php echo $text_next_choice; ?></p>
                  <ul uk-accordion>
                    <?php foreach ($modules as $module) { ?>
                    <?php echo $module; ?>
                    <?php } ?>
                  </ul>
              </div>
          </div>
          <?php } ?>
      </div>


      <br />
      <div uk-grid>

      </div>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary"><?php echo $button_checkout; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
