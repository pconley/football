
# these are the power shell equivelent commands to the curl example

$Params = @{ query = '{ country(code: "DEN") {name} }' }
Invoke-Webrequest -method GET -uri http://localhost:3000/worldcup -Body $Params
 