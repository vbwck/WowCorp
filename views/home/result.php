<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */
/** @var app\models\SelfForm $model */

$this->title = 'Self Form';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-contact">


<?php if(!empty($model)){ ?>
<table class="table-styles">
    <caption>Результаты поиска по выбранной дате.</caption>
    <tr>
        <th>ПІБ (хто вирішив заявку)</th>
        <th>Відключення</th>
        <th>Перевірка/здешевлення</th>
        <th>Тех. питання</th>
        <th>Інше</th>
        <th>Усього</th>
    </tr>
        <?php $sumOrders = []; ?>
    <?php foreach ($categoryCounts['off'] as $person => $counts): ?>
        <tr>
            <td><?= $person ?></td>
            <?php foreach ($categoryCounts as $category => $people): ?>
                <td><?= $people[$person] ?? 0 ?></td>
                <?php $sumOrders[$person] = ($sumOrders[$person] ?? 0) + ($people[$person] ?? 0); ?>
            <?php endforeach; ?>
            <td><?= $sumOrders[$person] ?></td>
        </tr>
    <?php endforeach; ?>
</table>
<?php } ?>