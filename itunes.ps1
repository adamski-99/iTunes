Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser

$itunes = New-Object  -ComObject iTunes.Application



Add-Type -AssemblyName System.Windows.Forms
# Create a new form
$LocalPrinterForm                    = New-Object system.Windows.Forms.Form
# Define the size, title and background color
$LocalPrinterForm.ClientSize         = '500,300'
$LocalPrinterForm.text               = "Itunes Tag Changer"
$LocalPrinterForm.BackColor          = "#ffffff"

# Display the form
[void]$LocalPrinterForm.ShowDialog()