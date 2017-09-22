###Public Variables
$SQLServer = Read-Host "Unesi server i instancu u formatu Server\Instance" 
$MyUser = Read-Host "Unesi username u formatu domain/account"
$spDatabases = Get-SPDatabase

####Private Variables
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server = $SQLServer; Integrated Security = True" 

$SqlConnection.Open()
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.Connection = $SqlConnection

ForEach($spDatabase in $spDatabases)
{
    $SQLDBName = $spDatabase.Name   
    $SqlQuery = "use $SQLDBName; ALTER ROLE db_owner ADD MEMBER [$MYUSER];"
    $SqlCmd.CommandText = $SqlQuery
    $SqlCmd.ExecuteNonQuery() | Out-Null
}

$SqlConnection.Close()