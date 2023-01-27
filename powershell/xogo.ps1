$num1 = Read-Host "Introduce el primer numero (inferior)"
$num2 = Read-Host "Introduce el segundo numero (superior)"


$random = Get-Random -Minimum $num1 -Maximum $num2
$intento = 0

do{    
    $respuesta = Read-Host "Introduce un numero"
    $intento++
    if ($respuesta -gt $random) {
        echo "El numero es menor"
    }elseif ($respuesta -lt $random){
        echo "El numero es mayor"
    }
}
until ($random -eq $respuesta)

echo "Has acertado, tu numero de intentos fue $intento"