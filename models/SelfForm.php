<?php

namespace app\models;

use yii\base\Model;
/**
 * SelfForm class represents a model for handling date range input in the application.
 *
 * This class extends the Yii2 base Model class and includes attributes for the start and end dates.
 * It also defines default values for these attributes in the constructor.
 * Validation rules are specified to ensure that both dateStart and dateEnd are required.
 *
 * Usage Example:
 * ```php
 * $model = new SelfForm();
 * ```
 *
 * @property string $dateStart The start date of the date range.
 * @property string $dateEnd The end date of the date range.
 *
 * @package app\models
 */

class SelfForm extends Model
{
    public string $dateStart;
    public string $dateEnd;

    /**
     * Constructor method for initializing default attribute values.
     *
     * @param array $config Name-value pairs that will be used to initialize the object properties.
     */
    public function __construct($config = [])
    {
        parent::__construct($config);


        $this->dateStart = '';
        $this->dateEnd = '';
    }

    /**
     * Returns the validation rules for attributes.
     *
     * @return array Validation rules.
     */
    public function rules()
    {
        return [
            [['dateStart', 'dateEnd'], 'required'],
        ];
    }
}