<?php namespace Bama\Ormawa;

use System\Classes\PluginBase;
use Backend;

class Plugin extends PluginBase
{
    public function registerComponents()
    {
    }

    public function registerSettings()
    {
    }

    public function registerPermissions()
    {
        return [
            'bama.ormawa.access_users' => [
                'tab'   => 'ormawa',
                'label' => 'Bagian User'
            ],
            'bama.ormawa.access_admin' => [
                'tab'   => 'ormawa',
                'label' => 'Bagian Admin'
            ]
        ];
    }

    public function registerNavigation()
    {
        return [
                    // 'kegiatanukm' => [
                    //     'label' => 'kegiatan',
                    //     'icon'        => 'icon-paste',
                    //     'url'         => Backend::url('bama/ormawa/kegiatanukm'),
                    //     'permissions' => ['bama.ormawa.access_users']
                    // ],
                    'kegiatan' => [
                        'label' => 'kelola kegiatan',
                        'icon'        => 'icon-paste',
                        'url'         => Backend::url('bama/ormawa/kegiatan'),
                        'permissions' => ['bama.ormawa.*']
                    ],
                    'laporan' => [
                        'label' => 'laporan (LPJ)',
                        'icon'        => 'icon-book',
                        'url'         => Backend::url('bama/ormawa/laporan'),
                        'permissions' => ['bama.ormawa.access_users']
                    ],
                    'informasi' => [
                        'label' => 'Informasi',
                        'icon'        => 'icon-info',
                        'url'         => \Url::to('/'),
                        'permissions' => ['bama.ormawa.access_users']
                    ],
                ];
    }
}
