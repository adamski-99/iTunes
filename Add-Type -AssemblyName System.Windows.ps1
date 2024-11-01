Add-Type -AssemblyName System.Windows.Forms

# Function to fetch metadata from Discogs API (similar to the previous example)
function Get-DiscogsMetadata {
    param(
        [Parameter(Mandatory=$true)]
        [string]$artist,
        
        [Parameter(Mandatory=$true)]
        [string]$album
    )

    $url = "https://api.discogs.com/database/search?q=$artist $album&key=$discogsApiKey&secret=YOUR_DISCOGS_API_SECRET"

    # Use Invoke-WebRequest to fetch data from the API
    $response = Invoke-WebRequest -Uri $url -Method Get

    # Parse the JSON response
    $data = $response.Content | ConvertFrom-Json

    # Extract relevant metadata (adjust as needed)
    $metadata = [PSCustomObject]@{
        Artist = $data.results[0].artist
        Album = $data.results[0].title
        Year = $data.results[0].year
        Format = $data.results[0].format
        Label = $data.results[0].label
    }

    return $metadata
}

# Create a new Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Discogs Album Information"
$form.Size = New-Object System.Drawing.Size(400, 300)

# Create text boxes to display information
$artistTextBox = New-Object System.Windows.Forms.TextBox
$artistTextBox.Location = New-Object System.Drawing.Point(10, 10)
$artistTextBox.Size = New-Object System.Drawing.Size(300, 20)
$form.Controls.Add($artistTextBox)

$albumTextBox = New-Object System.Windows.Forms.TextBox
$albumTextBox.Location = New-Object System.Drawing.Point(10, 40)
$albumTextBox.Size = New-Object System.Drawing.Size(300, 20)
$form.Controls.Add($albumTextBox)

$yearTextBox = New-Object System.Windows.Forms.TextBox
$yearTextBox.Location = New-Object System.Drawing.Point(10, 70)
$yearTextBox.Size = New-Object System.Drawing.Size(300, 20)
$yearTextBox.ReadOnly = $true
$form.Controls.Add($yearTextBox)

# Create a button to fetch information
$fetchButton = New-Object System.Windows.Forms.Button
$fetchButton.Text = "Fetch"
$fetchButton.Location = New-Object System.Drawing.Point(10, 100)
$fetchButton.Size = New-Object System.Drawing.Size(100, 30)
$fetchButton.Add_Click({
    $artist = $artistTextBox.Text
    $album = $albumTextBox.Text

    $metadata = Get-DiscogsMetadata -artist $artist -album $album
    $yearTextBox.Text = $metadata.Year
    # Add more textboxes or labels to display other information as needed
})
$form.Controls.Add($fetchButton)

# Show the form
$form.ShowDialog()