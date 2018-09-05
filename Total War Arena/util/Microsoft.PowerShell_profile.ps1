function twa-tail { Get-Content -Path "AppData\Roaming\The Creative Assembly\Arena\logs\mp_log.txt" -Wait }
function unluac_file { java -jar "C:\Tools\unluac_2015_06_13.jar" $args }
function unluac {
    Get-ChildItem -Recurse -Include *.luac |
    Foreach-Object {
        echo  $_.FullName
        unluac_file $_.FullName > ($_.Directory.FullName + '\' + $_.BaseName + ".lua")
    }
}
