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
        Schema::table('office_shifts', function (Blueprint $table) {
            $table->string('monday_break_in')->nullable();
            $table->string('monday_break_out')->nullable();
            $table->string('tuesday_break_in')->nullable();
            $table->string('tuesday_break_out')->nullable();
            $table->string('wednesday_break_in')->nullable();
            $table->string('wednesdat_break_out')->nullable();
            $table->string('thursday_break_in')->nullable();
            $table->string('thursday_break_out')->nullable();
            $table->string('friday_break_in')->nullable();
            $table->string('friday_break_out')->nullable();
            $table->string('saturday_break_in')->nullable();
            $table->string('saturday_break_out')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('office_shifts', function (Blueprint $table) {
            //
        });
    }
};
