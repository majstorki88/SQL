#============================================================
# Backup a Database using PowerShell and SQL Server SMO
#============================================================ 

$dbToBackup = Read-Host "Unesi bazu za backup" 
$BackupServer = Read-host "Unesi hostname servera za backup" 
$RestoreServer = Read-host "Unesi hostname servera za restore" 


#clear screen
#cls 
#"Step 1: backup" 
Get-Date -format yyyy_MM_dd-HH:mm:ss

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoEnum") | Out-Null 

#create a new server object
$serverBak = New-Object ("Microsoft.SqlServer.Management.Smo.Server") $BackupServer
$serverBak.ConnectionContext.StatementTimeout = 0

#$backupDirectory = $serverBak.Settings.BackupDirectory 
$backupDirectory = Read-Host "Unesi lokaciju backupa: PRIMER: \\hostname\backup"
#"Backup Directory: " + $backupDirectory 

$db = $serverBak.Databases[$dbToBackup]
$dbName = $db.Name 
#$timestamp = Get-Date -format yyyyMMddHHmmss
$timestamp = Get-Date -format yyyyMMdd
$smoBackup = New-Object ("Microsoft.SqlServer.Management.Smo.Backup") 

$smoBackup.Action = "Database"
$smoBackup.BackupSetDescription = "Full Backup of " + $dbName
$smoBackup.BackupSetName = $dbName + " Backup"
$smoBackup.CopyOnly = $true
$smoBackup.Database = $dbName
$smoBackup.MediaDescription = "Disk"
$smoBackup.PercentCompleteNotification = 2;
$smoBackup.Devices.AddDevice($backupDirectory + "\" + $dbName + "_" + $timestamp + ".bak", "File")
$smoBackup.SqlBackup($serverBak)
"Backup created" 
Get-Date -format yyyy_MM_dd-HH:mm:ss
