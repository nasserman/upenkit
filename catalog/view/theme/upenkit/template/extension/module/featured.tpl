<h3><?php echo $heading_title; ?></h3>
<div class="uk-child-width-1-1 uk-child-width-1-2@s uk-child-width-1-3@m uk-child-width-1-3@l uk-grid-match" uk-grid>
  <?php foreach ($products as $product) { ?>
  <div class="product-layout">
    <div class="product-thumb transition uk-transition-toggle uk-card uk-card-default uk-card-hover uk-card-small">

        <div class="uk-card-media-top">
            <div class="image">
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
            </div>
        </div>
      <div class="caption-remove uk-card-body">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <?php if(strlen($product['description']) > 3) { ?>
        <p><?php echo $product['description']; ?></p>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>

        <?php if ($product['special']) { ?>
        <div class="uk-card-badge uk-label uk-label-warning">Special</div>
        <?php } ?>

      </div>


      <div class="buttons-group uk-transition-fade uk-transition-slide-left-small" style="text-align:center;">
          <div>
            <a href="<?php echo $product['href']; ?>" class="uk-button uk-button-default uk-button-small" uk-icon="icon: expand"></a>
            <button type="button" class="uk-button uk-button-default uk-button-small" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" uk-icon="icon: heart"></button>
            <button type="button" class="uk-button uk-button-default uk-button-small" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" uk-icon="icon : settings"></button>
          </div>
      </div>

      <div class="uk-card-footer">
          <div style="text-align:center;">
              <button type="button" class="add-to-cart-button uk-button uk-button-primary" onclick="cart.add('<?php echo $product['product_id']; ?>');" uk-icon="icon: cart"><?php echo $button_cart; ?></button>
          </div>
      </div>



    </div>
  </div>
  <?php } ?>
</div>
