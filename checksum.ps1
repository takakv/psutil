$path = $args[0]
$checkvalue = $args[1]

# Null coalescence supported from PSv7 upwards
$algorithm = if ($null -eq $args[2]) { "SHA256" } else { $args[2] }

if ( !$path ) {
  Write-Host "Please provide a path."
  exit
}

if ( !$checkvalue ) {
  Get-FileHash $path
  exit
}

$hash = Get-FileHash $path -Algorithm $algorithm | Select-Object -ExpandProperty Hash
$result = $hash -ceq $checkvalue

if ($result) {
  Write-Host "The hash is valid."
}
else {
  Write-Host "The hash is invalid."
  Write-Host "File hash`t:" $hash
  Write-Host "Check hash`t:" $checkvalue
}
