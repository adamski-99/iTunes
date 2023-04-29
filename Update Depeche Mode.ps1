#Create iTunes Object
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser

$itunes = New-Object  -ComObject iTunes.Application
$newAlbum = ""
$AlbumDate = ""
$regex = '(?<filedate>\d{4}(?:\.|-|_)?\d{2}(?:\.|-|_)?\d{2})[^0-9]'
#loop through tracks

$processed = 0

foreach ( $track in $iTunes.LibrarySource.Playlists.ItemByName("Depeche Mode -").Tracks){


        Write-Host "Album:        " $track.Album
        Write-Host "Name:         " $track.Name
        Write-Host "Artist:       " $track.Artist
        Write-Host "Album Artist: " $track.AlbumArtist
        
        $newAlbum = $track.Album
        
        #Extract 'Depeche Mode - YYYY-MM-DD - '
        #Extract 'Depeche Mode - YYYY - Pre'

        $newAlbum = $newAlbum.TrimStart('Depeche Mode - ')
        $AlbumDate = $newAlbum.Substring(0,12)

        Write-Host 'Remove Band Name ' $newAlbum
        Write-Host 'Year ' $AlbumDate
        $newAlbum = $newAlbum.TrimStart($AlbumDate)
        

        #if ($newAlbum.Substring(7,3) = '- Pre' )
        #{
         
         #Write-Host 'Trimmed 2b:-' $newAlbum
         #$newAlbum = $newAlbum.TrimStart(' - ')
         #Write-Host 'Trimmed 2b:-' $newAlbum
        #}
        
        Write-Host "New Album Name is: " $newAlbum
        $track.Album = $newAlbum
   
                   
        Write-Host '---------------------'               
        $track.UpdateInfoFromFile()
        $processed++


}

write-host "Processed: " $processed




