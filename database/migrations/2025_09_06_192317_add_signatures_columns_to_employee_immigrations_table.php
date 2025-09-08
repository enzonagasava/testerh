<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('employee_immigrations', function (Blueprint $table) {
            $table->longText('employee_signature')->nullable();
            $table->dateTime('employee_signed_at')->nullable();
            $table->longText('internal_user_signature')->nullable();
            $table->dateTime('internal_user_signed_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('employee_immigrations', function (Blueprint $table) {
            //
        });
    }
};
