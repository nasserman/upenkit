<h3><?php echo $heading_title; ?></h3>
<div class="products-thumb-list" >
  <?php foreach ($products as $product) { ?>
  <div class="product-layout">
  <?php include("catalog/view/theme/upenkit/template/parts/product_thumb.php"); ?>
  </div>
  <?php } ?>
</div>
