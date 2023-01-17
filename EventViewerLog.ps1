#Path to the Project Log
$projectLogDir = "C:\Release\Logs"; 

#Delete Logs folder
Remove-Item -Path ".\Logs" -Recurse -Force -erroraction silentlycontinue

#Create Logs folder if not exists
[IO.Directory]::CreateDirectory(".\Logs")

#Generate error log only from EventViewer
Get-WinEvent -FilterHashTable @{LogName='Application';Level='2'} -MaxEvents 50  | Format-List >> .\Logs\EventViewerError.txt

#Optional Copy from other project logs file to here
if ($projectLogDir -ne $null) {
    Copy-Item -Path $projectLogDir -Destination ".\Logs" -Recurse -Force
}