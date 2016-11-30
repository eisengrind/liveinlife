D:

set SIGNFILE=lilc0.6.5.biprivatekey

del /F /Q "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\@LiveInLifeServer\addons\*"
del /F /Q "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer\packlog.log"
cd D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer
FOR /D %%G in (*) do "D:\Programs\Steam\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe" "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer\%%G" "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\@LiveInLifeServer\addons" -prefix=%%G  -sign="D:\Programs\Steam\steamapps\common\Arma 3 Tools\DSSignFile\%SIGNFILE%" -include="D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer\include.txt" >> "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer\packlog.log" 2>&1
