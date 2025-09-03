<?php
namespace App\Http\traits;

trait ENVFilePutContent{

public function dataWriteInENVFile($key, $value)
{
    $path = app()->environmentFilePath();
    $content = file_get_contents($path);

    if ($key === "MAIL_FROM_NAME") {
        // Colocar aspas no nome
        $value = '"' . $value . '"';
    } elseif ($key === "MAIL_PASSWORD") {
        // Remover espaços e não colocar aspas na senha
        $value = str_replace(' ', '', $value);
    }

    // Regex para substituir a linha que começa com $key=
    $pattern = "/^{$key}=.*$/m";

    if (preg_match($pattern, $content)) {
        // Substitui a linha existente
        $content = preg_replace($pattern, "{$key}={$value}", $content);
    } else {
        // Se não existir, adiciona no final
        $content .= "\n{$key}={$value}\n";
    }

    file_put_contents($path, $content);
}

}
