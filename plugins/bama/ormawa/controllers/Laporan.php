<?php namespace Bama\Ormawa\Controllers;

use Backend\Classes\Controller;
use BackendMenu;
use Bama\Ormawa\Models\Laporan as Model;

class Laporan extends Controller
{
    public $implement = [        'Backend\Behaviors\ListController',        'Backend\Behaviors\FormController'    ];
    
    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Bama.Ormawa', 'ormawa', 'laporan');
    }

    public function listExtendQuery($query)
    {
        // $user = BackendAuth::getUser();
        $user_id = $this->user->id;
        if ($this->user->hasAccess('bama.ormawa.access_users')) {
            $query->with('kegiatan', 'kegiatan.user')
                    ->whereHas('kegiatan', function($q) use($user_id){
                        $q->where('user_id', $user_id);
                    });

                // ->where('kegiatan', 1);
            }
    }

    public function preview($id)
    {
        parent::preview($id);
        if ($this->user->hasAccess('bama.ormawa.access_admin')) {
            $model = Model::find($id);
            if (!$model->dilihat) {
                $model->dilihat = True;
                $model->save();
            }
        }

        # code...
    }
}
