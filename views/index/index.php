<?php

use yii\bootstrap\ActiveForm;
 
 $form = ActiveForm::begin();?>
	<?php echo $form->field($model, 'name');?>
	<?php echo Html::submitButton('Send', ['class' => 'btn btn-success']);?>
<?php ActiveForm::end();?>
 	
<?php
$js = <<<JS
    $('form').on('beforeSubmit', function(){
        alert('Работает!');
        return false;
    });
JS;
 
$this->registerJs($js);
?>