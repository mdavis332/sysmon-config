$content = [System.IO.File]::ReadAllText("C:\Program Files\Graylog\collector-sidecar\collector_sidecar.yml").Replace("tls_skip_verify: false","tls_skip_verify: true")
[System.IO.File]::WriteAllText("C:\Program Files\Graylog\collector-sidecar\collector_sidecar.yml", $content)
