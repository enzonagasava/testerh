<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    use HasFactory;

    protected $table = 'districts';

    public function regional() {
        return $this->belongsTo(Regional::class, 'regional_id', 'id');
    }
}
