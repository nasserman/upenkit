<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>

<!-- UIKit +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<link rel="stylesheet" href="catalog/view/theme/upenkit/uikit/css/uikit.min.css" />
<link href="catalog/view/theme/upenkit/stylesheet/uikit-theme/upenkit.css" rel="stylesheet">
<script src="catalog/view/theme/upenkit/uikit/js/uikit.min.js"></script>
<script src="catalog/view/theme/upenkit/uikit/js/uikit-icons.min.js"></script>
<!-- UIKit +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/upenkit/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/upenkit/stylesheet/uikit-override.css" rel="stylesheet">


<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/upenkit/js/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">


<header class="uk-margin-medium-bottom">
    <nav id="top-nav" class="uk-navbar-container" uk-sticky="bottom: #offset">
        <div class="uk-container">

            <nav class="uk-navbar-container uk-navbar-transparent" uk-navbar >

                <div class="uk-navbar-left">
                    <ul class="uk-navbar-nav">
                        <?php echo $cart; ?>
                        <?php echo $currency; ?>
                        <?php echo $language; ?>
                    </ul>
                </div>

                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav">
                        <li>
                            <a href="<?php echo $contact; ?>" uk-icon="icon: whatsapp"><?php echo $telephone; ?></a>
                        </li>

                        <li>
                            <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" uk-icon="icon: user">
                                <?php echo $text_account; ?>
                            </a>
                            <div class="uk-navbar-dropdown" uk-dropdown="pos: bottom-right; offset: 0;">
                                <ul class="uk-nav uk-navbar-dropdown-nav">
                                    <?php if ($logged) { ?>
                                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                    <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                    <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                    <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                    <?php } else { ?>
                                    <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                    <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </li>

                        <li>
                            <a href="#" title="<?php echo $text_shopping_cart; ?>" uk-icon="icon: cart">
                                <?php echo $text_shopping_cart; ?>
                            </a>
                            <div class="uk-navbar-dropdown" uk-dropdown="pos: bottom-right; offset: 0;">
                                <ul class="uk-nav uk-navbar-dropdown-nav">
                                    <li>
                                        <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>" uk-icon="icon: heart"><?php echo $text_wishlist; ?></a></li>
                                    <li>
                                        <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>" uk-icon="icon: cart"><?php echo $text_shopping_cart; ?></a>
                                    </li>
                                    <li>
                                        <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>" uk-icon="icon: users"><?php echo $text_checkout; ?></a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                    </ul>
                </div>

            </nav>

        </div>
    </nav>

    <div class="uk-cover-container">
        <canvas width="100%" height="200px"></canvas>
        <img uk-cover src="<?php echo $upenkit_header_image_path; ?>" alt="">
        <div class="uk-overlay uk-position-center">
            <div id="logo">
              <?php if ($logo) { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
              <?php } else { ?>
              <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
              <?php } ?>
            </div>
        </div>
    </div>

    <nav class="uk-navbar-container" id="menu">
        <div class="uk-container">
            <nav class="uk-navbar" uk-navbar>
                <div class="uk-navbar-left uk-margin-remove-left">
                    <ul class="uk-navbar-nav nav">
                        <li>
                            <a href="<?php echo $home; ?>"><?php echo $name; ?></a>
                        </li>
                        <?php if ($categories) { ?>
                        <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                        <li>
                            <a href="<?php echo $category['href']; ?>">
                                <?php echo $category['name']; ?>
                            </a>
                            <div class="uk-navbar-dropdown" uk-drop="offset:0; boundary: !nav; boundary-align: true; pos: bottom-justify;animation: uk-animation-slide-top-small;duration:300">
                                <div class="uk-navbar-dropdown-grid uk-child-width-1-<?php echo $category['column']; ?>" uk-grid>
                                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                    <div>
                                        <ul class="uk-nav uk-navbar-dropdown-nav">
                                            <?php foreach ($children as $child) { ?>
                                            <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                <?php } ?>
                                </div>
                            </div>
                        </li>

                        </li>
                        <?php } else { ?>
                        <li>
                            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                        </li>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                </div>

                <?php echo $search; ?>
            </nav>
        </div>
    </nav>
</header>
