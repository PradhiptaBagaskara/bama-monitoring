<?php namespace Bama\Ormawa\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateBamaOrmawaKegiatan extends Migration
{
    public function up()
    {
        Schema::create('bama_ormawa_kegiatan', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->text('nama')->nullable();
            $table->text('deskripsi')->nullable();
            $table->integer('status')->nullable();
            $table->text('reason')->nullable();
            $table->integer('user_id')->nullable();
            $table->string('anggaran')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('bama_ormawa_kegiatan');
    }
}
