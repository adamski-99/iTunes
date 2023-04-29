$itunes = New-Object  -ComObject iTunes.Application
$itunes.LibraryPlaylist | Select-Object