$lista = New-Object Collections.Generic.List[int]

do{
    $read = Read-Host "Escribe una palabra"
    if($read -ne 0){
        $lista.add($read)
    }
}until($read -eq 0)

Write-Output $lista | Sort-Object 