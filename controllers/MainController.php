<?php

namespace app\controllers;

use Yii;
use app\models\Query;
use app\models\Subject;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\data\SqlDataProvider;

class MainController extends Controller {

    public function actionIndex() {
        return $this->render('index');
    }

    // public function actionList() {
    //     $dataProvider = new SqlDataProvider([
    //         'sql' => 'SELECT corps.name, type.type, count(*) AS list FROM type INNER JOIN audience ON type.id = audience.idType INNER JOIN corps ON audience.idCorps = corps.id GROUP BY type.id, audience.idCorps ORDER BY corps.name, type.type'
    //     ]);

    //     return $this->render('list', ['dataProvider' => $dataProvider]);
    // 
    public function actionMid() {
        $dataProvider = new SqlDataProvider([
            'sql' => 'SELECT student.*, journal.* FROM student INNER JOIN journal ON student.id = journal.idStudent WHERE (presence = false OR estimate = 2)'
            //INNER JOIN date ON journal.idStudent = date.id INNER JOIN subject ON date.idSubject = subject.id '
            //INNER JOIN academicPlan ON subject.idAcademicPlan = academicPlan.id'
        ]);
        return $this->render('mid', ['dataProvider' => $dataProvider]);
    }

    public function actionQuery() {
        $model = new Query();
        $dropList = new Subject();

        $dataProvider = new SqlDataProvider([
            'sql' => 'SELECT student.*, journal.*, subject.name FROM student INNER JOIN journal ON student.id = journal.idStudent INNER JOIN date ON journal.idJournal = date.id INNER JOIN subject ON date.idSubject = subject.id WHERE ((presence = false OR estimate = 2) AND name = :subject) AND (date BETWEEN :date1 AND :date2)',
            'params' => [':subject' => 'Механика', ':date1' => '2006-05-05', ':date2' => '2022-10-01']
        ]);

        return $this->render('query', ['dataProvider' => $dataProvider, 'model' => $model, 'dropList' => $dropList]);
    }
}