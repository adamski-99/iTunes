

#Create iTunes Object
$itunes = New-Object  -ComObject iTunes.Application

#loop through tracks

$processed = 0

#Remove Comma from Artist Name and Update Album Artist 


$playlist = $iTunes.LibrarySource.Playlists.ItemByName("VA")

if ( $playlist.Smart -eq $true )
   
$playlist.

{
   Write-Host "Smart Playlist"
}


#$track in $iTunes.LibrarySource.Playlists.ItemByName("Artist with Commas").Tracks

Write-Host $playlist.Tracks.Count

foreach ( $track in $playlist.Tracks){


        ##Write-Host "Album " $track.Album
        ##Write-Host "Name " $track.Name
        ##Write-Host "Artist " $track.Artist
        
                                
        #Remove trailing comma from artist
                      
        $processed++


}

write-host "Processed: " $processed

