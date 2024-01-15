<?php

namespace app\controllers;


use app\models\Orders;
use yii\web\Controller;
use app\models\SelfForm;


class HomeController extends Controller
{
    /**
     * Renders the page for user input and redirects to the 'check' action with the specified date range.
     *
     * This action handles both the initial rendering of the user input page and the submission of the form.
     * When the form is submitted, it extracts the date range from the form model and redirects to the 'check' action
     * with the specified date start and end parameters.
     *
     * @return string|\yii\web\Response The rendered 'self_form' view or a redirect response to the 'check' action.
     */
    public function actionPage()
    {
        // Create a new instance of the SelfForm model
        $model = new SelfForm();

        // Check if the request is a POST request
        if (\Yii::$app->request->isPost) {
            // Set the model attributes from the POST data
            $model->attributes = \Yii::$app->request->post('SelfForm');

            // Extract the date start and end from the model
            $dateStart = $model->dateStart;
            $dateEnd = $model->dateEnd;

            // Redirect to the 'check' action with the specified date range
            return $this->redirect(['check', 'dateStart' => $dateStart, 'dateEnd' => $dateEnd]);
        }
        // Render the 'self_form' view with the model
        return $this->render('self_form', [
            'model' => $model,
        ]);
    }
    /**
     * Checks and returns the results of orders within a specified time period.
     *
     * The method queries the database to obtain information about orders in a given date range.
     * Results are grouped by category and person's name, and the number of orders for each category and person is calculated.
     *
     * @param string $dateStart Start date of the period in 'Y-m-d' format.
     * @param string $dateEnd The end date of the period in 'Y-m-d' format.
     *
     * @return string Renders the 'result' view with the passed data.
     */
    public function actionCheck($dateStart,$dateEnd)
    {
        // Retrieving order components from the database
        $dateComponents = Orders::find()
            ->select(['category', 'COUNT(*) AS count_per_category', 'name'])
            ->leftJoin('category_connection', 'category_connection.category_id = orders.id') // Предполагается, что orders.id соответствует category_assignment.category_id
            ->where(['between', 'date', $dateStart, $dateEnd])
            ->andWhere(['category' => ['support', 'off', 'check', 'another']])
            ->groupBy(['category', 'orders.name']) // Группируем по категории и имени человека
            ->asArray()
            ->all();

        // Formation of an associative array with counts for each category and person
        $categoryCounts = [];
        foreach ($dateComponents as $count) {
            $categoryCounts[$count['category']][$count['name']] = $count['count_per_category'];
        }


        // Return rendering of the 'result' view with the passed data
        return $this->render('result', [
            'model' => $dateComponents,
            'categoryCounts' => $categoryCounts,
        ]);
    }

}