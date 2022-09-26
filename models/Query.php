<?php

namespace app\models;

use yii\base\Model;

class Query extends Model {

    public $date1;
    public $date2;
    public $subject;

    public function rules() {
        return [ 
            [['date1', 'date2', 'subject'], 'required']
        ];
    }

}