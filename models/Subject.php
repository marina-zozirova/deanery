<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "subject".
 *
 * @property int $id
 * @property string|null $name
 * @property int|null $hoursPratctise
 * @property int|null $idAcademicPlan
 * @property int|null $hoursLection
 *
 * @property Date[] $dates
 * @property AcademicPlan $idAcademicPlan0
 */
class Subject extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'subject';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['hoursPratctise', 'idAcademicPlan', 'hoursLection'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['idAcademicPlan'], 'exist', 'skipOnError' => true, 'targetClass' => AcademicPlan::class, 'targetAttribute' => ['idAcademicPlan' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'hoursPratctise' => 'Hours Pratctise',
            'idAcademicPlan' => 'Id Academic Plan',
            'hoursLection' => 'Hours Lection',
        ];
    }

    /**
     * Gets query for [[Dates]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDates()
    {
        return $this->hasMany(Date::class, ['idSubject' => 'id']);
    }

    /**
     * Gets query for [[IdAcademicPlan0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdAcademicPlan0()
    {
        return $this->hasOne(AcademicPlan::class, ['id' => 'idAcademicPlan']);
    }
}
