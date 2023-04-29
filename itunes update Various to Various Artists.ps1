#Create iTunes Object
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser

$itunes = New-Object  -ComObject iTunes.Application

#loop through tracks

$processed = 0

foreach ( $track in $iTunes.LibrarySource.Playlists.ItemByName("Various").Tracks) {
                                        
    #Make Album Artist equal to Artist
    $track.AlbumArtist = "Various Artists"

    $track.UpdateInfoFromFile()
                       
    $processed++
    
}

write-host "Various Processed: " $processed


$processed = 0

foreach ( $track in $iTunes.LibrarySource.Playlists.ItemByName("VA").Tracks) {
                                        
    #Make Album Artist equal to Artist
    $track.AlbumArtist = "Various Artists"

    $track.UpdateInfoFromFile()
                       
    $processed++
    
}

write-host "VA Processed: " $processed

