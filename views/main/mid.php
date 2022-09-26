<?php

use yii\grid\GridView;

echo GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
        'surname',
        'firstName',
        'patronymic',
        'dateOfBirth',
        'course',
        'presence',
        'estimate',
        ['class' => 'yii\grid\ActionColumn'],
    ]
]); 

?>