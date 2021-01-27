<?php namespace Bama\Ormawa\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateBamaOrmawaLaporan extends Migration
{
    public function up()
    {
        Schema::table('bama_ormawa_laporan', function($table)
        {
            $table->boolean('dilihat')->default(false);
        });
    }
    
    public function down()
    {
        Schema::table('bama_ormawa_laporan', function($table)
        {
            $table->dropColumn('dilihat');
        });
    }
}
