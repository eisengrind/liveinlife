
SETLOCAL

set SIGNFILE=lilc0.6.5.biprivatekey
for %%a in (%1) do set currentFolder=%%~na

IF NOT [%1] == [] (
	D:
	
	IF NOT [%currentFolder%] == [] (
		cd D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer
		"D:\Programs\Steam\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe" "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer\%currentFolder%" "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\@LiveInLifeServer\addons" -prefix=%currentFolder%  -sign="D:\Programs\Steam\steamapps\common\Arma 3 Tools\DSSignFile\%SIGNFILE%" -include="D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer\include.txt" >> "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\LiveInLifeServer\packlog.log" 2>&1
	)
)
