$user = Get-ChildItem -Directory C:\Users | Select-Object -First 1 | Select-Object -ExpandProperty Name
echo "Starting komorebi for user $user"
$Env:KOMOREBI_CONFIG_HOME = "C:\Users\$user\Documents\repos\Windots\komorebi"
komorebic start --ahk --bar
