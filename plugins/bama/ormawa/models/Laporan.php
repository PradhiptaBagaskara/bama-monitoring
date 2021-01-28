<?php namespace Bama\Ormawa\Models;

use Model;
use Bama\Ormawa\Models\Kegiatan;

/**
 * Model
 */
class Laporan extends Model
{
    use \October\Rain\Database\Traits\Validation;
    

    /**
     * @var string The database table used by the model.
     */
    public $table = 'bama_ormawa_laporan';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
    public $attachOne = [
        'file' => 'System\Models\File',
    ];
    public $belongsTo = [
        'kegiatan' => Kegiatan::class,
        'kegiatan_option' => [Kegiatan::class, 'conditions' => 'status = 1', 'key'=>'kegiatan_id'],
    ];


}
