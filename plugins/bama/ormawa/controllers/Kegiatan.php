<?php namespace Bama\Ormawa\Controllers;

use Backend\Classes\Controller;
use BackendMenu;
use Backend\Behaviors\RelationController;
use Bama\Ormawa\Models\Kegiatan as Model;
use Bama\Ormawa\Models\Laporan ;
use BackendAuth;


class Kegiatan extends Controller
{
    public $implement = [       
         'Backend\Behaviors\ListController',        
         'Backend\Behaviors\FormController',    
         RelationController::class,
     
         ];
    
    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';
    public $relationConfig = 'config_relation.yaml';

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Bama.Ormawa', 'ormawa', 'kegiatan');
        // $prep = new \stdClass;
        // $prep->reason = '';
        // $prep->deskripsi = '';
        // $this->vars['kegiatanUser'] = $prep;
 
    }

    public function update($id)
    {
        parent::update($id);
        $this->laporanRender($id);
        $this->vars['kegiatanUser'] = $this->vars['formModel']->withUser($id);

    }

    public function canCreate()
    {
        $model = Model::whereUserId($this->user->id);
        // if (condition) {
        //     # code...
        // }
        # code...
    }
    public function create()
    {
        parent::create();
        if ($this->user->hasAccess('bama.ormawa.access_admin')) {
            abort(404);
        }


    }

    public function preview($id)
    {
        parent::preview($id);
        $this->laporanRender($id);
        # code...
    }

    public function formExtendFields($form)
    {
        if ($this->action == 'create') {
            # code...
            $form->removeField('reason_preview');
            $form->removeField('deskripsi_preview');


        }
        if ($this->user->hasAccess('bama.ormawa.access_admin')) {

            $form->removeField('deskripsi');
            $form->removeField('reason_preview');
            $form->removeField('anggaran');
            $form->removeField('file');
            $form->removeField('nama');
            $form->removeField('new_laporan');
        }
        $alasan= $form->getField('deskripsi');
        if ($this->user->hasAccess('bama.ormawa.access_users')) {

            $form->removeField('reason');
            $form->removeField('deskripsi_preview');

            $form->removeField('status');
            $form->removeField('anggaran_acc');
        }
    }

    public function laporanRender($id)
    {
        // name: Kegiatan
        // form: $/bama/ormawa/models/kegiatan/fields.yaml
        // modelClass: Bama\Ormawa\Models\Kegiatan
        // defaultRedirect: bama/ormawa/kegiatan
        // create:
        //     redirect: 'bama/ormawa/kegiatan/update/:id'
        //     redirectClose: bama/ormawa/kegiatan
        // update:
        //     redirect: bama/ormawa/kegiatan
        //     redirectClose: bama/ormawa/kegiatan
        $config = $this->makeConfig('$/bama/ormawa/models/laporan/columns_extend.yaml');
        
        $config->model = new Laporan;
     
        $config->recordUrl = 'bama/ormawa/laporan/preview/:id';
        $widget = $this->makeWidget('Backend\Widgets\Lists', $config);
        $widget->bindEvent('list.extendQueryBefore', function ($query) use($id) {
            // return $this->searchQuery($query);
            $query->with('kegiatan')
            ->where('kegiatan_id', $id);

        });
        $widget->bindToController();
        $this->vars['widget'] = $widget;
        return $widget;
    }

    public function searchQuery($query)
    {
    // Do some query here!
    }


    public function listExtendQuery($query)
    {
        $user = BackendAuth::getUser();
        if ($user->hasAccess('bama.ormawa.access_users')) {
            $query->with('user')
                ->where('user_id', $user->id);
            }
        }

}
