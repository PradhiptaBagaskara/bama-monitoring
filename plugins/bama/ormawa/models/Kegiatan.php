<?php namespace Bama\Ormawa\Models;

use Model;
use RainLab\User\Models\User;
use Bama\Ormawa\Models\Laporan;
/**
 * Model
 */
class Kegiatan extends Model
{
    use \October\Rain\Database\Traits\Validation;
    

    /**
     * @var string The database table used by the model.
     */
    public $table = 'bama_ormawa_kegiatan';

    /**
     * @var array Validation rules
     */

    public $belongsTo = [
        'user' => ['Backend\Models\User'],
        // 'laporan' => [Laporan::class, 'key' => 'kegiatan_id'],
    ];

    public $attachOne = [
        'file' => 'System\Models\File',
    ];
    
    public $hasMany = [
        'laporan' => Laporan::class,
        'status_laporan' => [
            Laporan::class, 
            'count' => true,
            'conditions' => 'dilihat = 0'
            ]

    ];

    public $rules = [
    ];

    public function scopeWithUser($query, $id)
    {
        $query->with('user');
        return $query->find($id);
        # code...
    }

    public function getStringStatus()
    {
        if ($this->status == 0) {
            return 'REVIEW';
        }elseif ($this->status == 1) {
            return 'DITERIMA';
        }else{
            return 'DITOLAK';
        }
    }
}
