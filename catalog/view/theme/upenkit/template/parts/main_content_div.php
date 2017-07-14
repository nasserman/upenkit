<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'uk-width-1-1 uk-width-1-2@m'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'uk-width-1-1 uk-width-3-4@m'; ?>
<?php } else { ?>
<?php $class = 'uk-width-1-1'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>">
