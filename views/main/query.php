<?php

use app\models\Subject;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\grid\GridView;


$form = ActiveForm::begin();

echo $form->field($model, 'date1')->textInput(['type' => 'date']);
echo $form->field($model, 'date2')->textInput(['type' => 'date']);
echo $form->field($dropList, 'name')->dropDownList(ArrayHelper::map(Subject::find()->all(), 'id', 'name')); 

echo GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
        'surname',
        'firstName',
        'patronymic',
        'name',
        'course',
        ['class' => 'yii\grid\ActionColumn'],
    ]
]); 

 

