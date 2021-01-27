<?php namespace Bama\Ormawa\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateBamaOrmawaKegiatan extends Migration
{
    public function up()
    {
        Schema::table('bama_ormawa_kegiatan', function($table)
        {
            $table->string('anggaran_acc')->nullable();
            $table->integer('status')->default(0)->change();
        });
    }
    
    public function down()
    {
        Schema::table('bama_ormawa_kegiatan', function($table)
        {
            $table->dropColumn('anggaran_acc');
            $table->integer('status')->default(null)->change();
        });
    }
}
