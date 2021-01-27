<?php namespace Bama\Ormawa\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateBamaOrmawaLaporan extends Migration
{
    public function up()
    {
        Schema::create('bama_ormawa_laporan', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('title')->nullable();
            $table->text('description')->nullable();
            $table->integer('kegiatan_id')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('bama_ormawa_laporan');
    }
}
