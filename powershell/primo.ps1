function primo($x){
    $boolean = "false"
    for ($i = 2; $i -lt $x; $i++) {
        if($x % $i -eq 0){
            $boolean = "true"
        }
    }


    if(($boolean -eq "false") -and ($x -ne 1) -and ($x -ne 0)){
        echo "Es primo";
    }else{
        echo "No es primo";
    }
}

$salir=1;

do{
    $num = Read-Host "Introduce un número"
    $resultado = primo $num
    $resultado
    $salir = Read-Host "Si quieres salir escribe 0"
}
until ($salir -eq 0)