#Create iTunes Object
$itunes = New-Object  -ComObject iTunes.Application
$newAlbum = ""
#loop through tracks

$processed = 0

foreach ( $track in $iTunes.LibrarySource.Playlists.ItemByName("Beatport").Tracks){


        Write-Host "Album " $track.Album
        Write-Host "Name " $track.Name
        Write-Host "Artist " $track.Artist
                                
        #Make album equal track name upto first bracket
        $startPos =  $track.Name.Indexof("(")
        write-host $startPos
        
        if ( $startPos -gt 0 ) {

            $newAlbum = $track.Name.Substring(0,$startPos)
            $newAlbum = $newAlbum.Trim()
        }
        else
        {
            $newAlbum = $track.Name
        }
        
        write-host "New Name " $newAlbum

        $track.AlbumArtist = $track.Artist
        $track.Album = $newAlbum
               
        $processed++


}

write-host "Processed: " $processed




