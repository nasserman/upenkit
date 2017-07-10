<?php echo $header; ?>
<div class="uk-container uk-margin-medium-top">
    <div uk-grid>
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'uk-width-1-1 uk-width-1-2@m'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'uk-width-1-1 uk-width-3-4@m'; ?>
        <?php } else { ?>
        <?php $class = 'uk-width-1-1'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>
