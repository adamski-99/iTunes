<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    frmItunes
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$FrmItunes                       = New-Object system.Windows.Forms.Form
$FrmItunes.ClientSize            = New-Object System.Drawing.Point(656,522)
$FrmItunes.text                  = "Itunes Album Artist Changer"
$FrmItunes.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$ButtonCancel                    = New-Object system.Windows.Forms.Button
$ButtonCancel.text               = "Cancel"
$ButtonCancel.width              = 60
$ButtonCancel.height             = 30
$ButtonCancel.location           = New-Object System.Drawing.Point(588,477)
$ButtonCancel.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$ButtonOk                        = New-Object system.Windows.Forms.Button
$ButtonOk.text                   = "Change"
$ButtonOk.width                  = 69
$ButtonOk.height                 = 30
$ButtonOk.location               = New-Object System.Drawing.Point(507,476)
$ButtonOk.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$ComboPlaylists                  = New-Object system.Windows.Forms.ComboBox
$ComboPlaylists.text             = "Playlists"
$ComboPlaylists.width            = 411
$ComboPlaylists.height           = 83
$ComboPlaylists.location         = New-Object System.Drawing.Point(204,20)
$ComboPlaylists.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label                           = New-Object system.Windows.Forms.Label
$Label.text                      = "Play Lists:"
$Label.AutoSize                  = $true
$Label.width                     = 25
$Label.height                    = 10
$Label.location                  = New-Object System.Drawing.Point(93,24)
$Label.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Change Album Artist to:"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(13,56)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$txtChangedTo                    = New-Object system.Windows.Forms.TextBox
$txtChangedTo.multiline          = $false
$txtChangedTo.width              = 413
$txtChangedTo.height             = 20
$txtChangedTo.location           = New-Object System.Drawing.Point(204,55)
$txtChangedTo.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$cbCompilation                   = New-Object system.Windows.Forms.CheckBox
$cbCompilation.text              = "Compilation?"
$cbCompilation.AutoSize          = $true
$cbCompilation.width             = 95
$cbCompilation.height            = 20
$cbCompilation.location          = New-Object System.Drawing.Point(204,90)
$cbCompilation.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$dgvResults                      = New-Object system.Windows.Forms.DataGridView
$dgvResults.text                 = "Track Info"
$dgvResults.TopMost              = $false
$dgvResults.width                = 634
$dgvResults.height               = 347
$dgvResultsData = @(@("``","","","",""))
$dgvResults.ColumnCount = 5
$dgvResults.ColumnHeadersVisible = $true
$dgvResults.Columns[0].Name = "Album"
$dgvResults.Columns[1].Name = "Album Artist"
$dgvResults.Columns[2].Name = "Compilation"
$dgvResults.Columns[3].Name = "New Album Artist"
$dgvResults.Columns[4].Name = "New Compilation Setting"
foreach ($row in $dgvResultsData){
          $dgvResults.Rows.Add($row)
      }
$dgvResults.location             = New-Object System.Drawing.Point(9,115)

$lbProgess                       = New-Object system.Windows.Forms.Label
$lbProgess.text                  = "Processed"
$lbProgess.AutoSize              = $true
$lbProgess.width                 = 25
$lbProgess.height                = 10
$lbProgess.location              = New-Object System.Drawing.Point(12,482)
$lbProgess.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$txtCurrent                      = New-Object system.Windows.Forms.TextBox
$txtCurrent.multiline            = $false
$txtCurrent.width                = 44
$txtCurrent.height               = 20
$txtCurrent.location             = New-Object System.Drawing.Point(82,478)
$txtCurrent.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$lbOf                            = New-Object system.Windows.Forms.Label
$lbOf.text                       = "of"
$lbOf.AutoSize                   = $true
$lbOf.width                      = 25
$lbOf.height                     = 10
$lbOf.location                   = New-Object System.Drawing.Point(137,482)
$lbOf.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$txtTotal                        = New-Object system.Windows.Forms.TextBox
$txtTotal.multiline              = $false
$txtTotal.width                  = 64
$txtTotal.height                 = 20
$txtTotal.location               = New-Object System.Drawing.Point(159,477)
$txtTotal.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$lbtracks                        = New-Object system.Windows.Forms.Label
$lbtracks.text                   = "tracks"
$lbtracks.AutoSize               = $true
$lbtracks.width                  = 25
$lbtracks.height                 = 10
$lbtracks.location               = New-Object System.Drawing.Point(234,480)
$lbtracks.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$FrmItunes.controls.AddRange(@($ButtonCancel,$ButtonOk,$ComboPlaylists,$Label,$Label1,$txtChangedTo,$cbCompilation,$dgvResults,$lbProgess,$txtCurrent,$lbOf,$txtTotal,$lbtracks))

$FrmItunes.Add_Load({ LoadForm })
$ButtonOk.Add_Click({ fnChangeAlbumArtists })
$ButtonCancel.Add_Click({ closeForm })

function LoadForm { 
    
    $itunes = New-Object  -ComObject iTunes.Application

    foreach ($Playlist in  $iTunes.LibrarySource.Playlists) {
        $ComboPlaylists.Items.Add( $Playlist.Name )
    }
    
    $newAlbumArtist = "Various Artists"
    
    $txtChangedTo.Text = $newAlbumArtist
    $cbCompilation.Checked = $true
    
}
function fnChangeAlbumArtists { }


        $itunes = New-Object  -ComObject iTunes.Application

        $processed = 0
        
        $txtTotal.text = $iTunes.LibrarySource.Playlists.ItemByName($ComboPlaylists.Text).count

        foreach ( $track in $iTunes.LibrarySource.Playlists.ItemByName($ComboPlaylists.Text).Tracks) {

            
            $track.AlbumArtist = $newAlbumArtist
        
            $newCompilationSetting = $true
            
            $dgvResults.Rows.Add($track.Album, $track.Name, $track.Artist, $track.AlbumArtist, $track.Compilation, $newAlbumArtist, $newCompilationSetting  )

            if ($track.Compilation -eq $false) {
                $track.Compilation = $newCompilationSetting

            }

            $track.UpdateInfoFromFile()
            $processed++
            $txtCurrent.Text = $processed
            
            
        }
        
        function closeForm(){FrmItunes.close(x)}
[void]$FrmItunes.ShowDialog()