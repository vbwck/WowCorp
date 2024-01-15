<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */
/** @var app\models\SelfForm $model */



use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;


$this->title = 'Self Form';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-contact">
    <h1><?= Html::encode($this->title) ?></h1>
        <div class="row">
            <div class="col-lg-5">
                <?php $form = ActiveForm::begin(['id' => 'self-form', 'method' => 'POST',]); ?>

                    <?= $form->field($model, 'dateStart')->textInput(['type' => 'date', 'placeholder'=>'Дата рішення с']); ?>

                    <?= $form->field($model, 'dateEnd')->textInput(['type' => 'date']); ?>

                    <div class="form-group">
                        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
                    </div>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
</div>

