<# #Create iTunes Object
#loop through tracks

<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser

$itunes = New-Object  -ComObject iTunes.Application
$newAlbum = ""
$AlbumDate = ""
$Playlists = ""

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$FrmItunes = New-Object system.Windows.Forms.Form
$FrmItunes.ClientSize = New-Object System.Drawing.Point(656, 170)
$FrmItunes.text = "Itunes Album Artist Changer"
$FrmItunes.TopMost = $false
$FrmItunes.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$ButtonCancel = New-Object system.Windows.Forms.Button
$ButtonCancel.text = "Cancel"
$ButtonCancel.width = 60
$ButtonCancel.height = 30
$ButtonCancel.location = New-Object System.Drawing.Point(578, 124)
$ButtonCancel.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$ButtonCancel.DialogResult = [System.Windows.Forms.DialogResult]::CANCEL

$ButtonOk = New-Object system.Windows.Forms.Button
$ButtonOk.text = "Change"
$ButtonOk.width = 60
$ButtonOk.height = 30
$ButtonOk.location = New-Object System.Drawing.Point(507, 123)
$ButtonOk.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$ComboPlaylists = New-Object system.Windows.Forms.ComboBox
$ComboPlaylists.text = "Playlists"
$ComboPlaylists.width = 411
$ComboPlaylists.height = 83
$ComboPlaylists.location = New-Object System.Drawing.Point(204, 20)
$ComboPlaylists.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

foreach ($Playlist in  $iTunes.LibrarySource.Playlists) {

        
        $ComboPlaylists.Items.Add( $Playlist.Name )

}


$Label = New-Object system.Windows.Forms.Label
$Label.text = "Play Lists:"
$Label.AutoSize = $true
$Label.width = 25
$Label.height = 10
$Label.location = New-Object System.Drawing.Point(93, 24)
$Label.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$Label1 = New-Object system.Windows.Forms.Label
$Label1.text = "Change Album Artist to:"
$Label1.AutoSize = $true
$Label1.width = 25
$Label1.height = 10
$Label1.location = New-Object System.Drawing.Point(13, 50)
$Label1.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$TextBox1 = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline = $false
$TextBox1.width = 422
$TextBox1.height = 20
$TextBox1.location = New-Object System.Drawing.Point(204, 55)
$TextBox1.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$CheckBox1 = New-Object system.Windows.Forms.CheckBox
$CheckBox1.text = "Compilation?"
$CheckBox1.AutoSize = $false
$CheckBox1.width = 95
$CheckBox1.height = 20
$CheckBox1.location = New-Object System.Drawing.Point(204, 90)
$CheckBox1.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)


$FrmItunes.controls.AddRange(@($ButtonCancel, $ButtonOk, $ComboPlaylists, $Label, $Label1, $TextBox1, $CheckBox1))

$result = $form.ShowDialog()
<#
if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        $x = $textBox.Text
        $x
}
#>

<#
$ButtonOk.Click 

{

        $processed = 0

        foreach ( $track in $iTunes.LibrarySource.Playlists.ItemByName("Various").Tracks) {


                Write-Host "Album:        " $track.Album
                Write-Host "Name:         " $track.Name
                Write-Host "Artist:       " $track.Artist
                Write-Host "Album Artist: " $track.AlbumArtist
                Write-Host "File Location: " $track.Location
                Write-Host "Compilation: " $track.Compilation
        
                if ($track.Compilation -eq $false) {
                        $track.Compilation = $true

                }
        
                $newArtist = "Various Artists"

                #Write-Host 'Remove Band Name ' $newAlbum
                #Write-Host 'Year ' $AlbumDate
                        
                Write-Host "New Album Artist is: " $newArtist
        
                $track.AlbumArtist = $newAlbumArtist
                Write-Host "New Compilation Setting: " $track.Compilation
                Write-Host '---------------------'               
                $track.UpdateInfoFromFile()
                $processed++
        }
        write-host "Processed: " $processed
}

#>
