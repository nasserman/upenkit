<h3><?php echo $heading_title; ?></h3>
<div class="uk-child-width-1-1 uk-child-width-1-2@s uk-child-width-1-3@m uk-child-width-1-3@l uk-grid-match" uk-grid>
  <?php foreach ($products as $product) { ?>
  <div class="product-layout">
  <?php include("catalog/view/theme/upenkit/template/parts/product_thumb.php"); ?>
  </div>
  <?php } ?>
</div>
