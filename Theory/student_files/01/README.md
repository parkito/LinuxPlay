1. Enable Hyper-V
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

2. set up proxy

```
$env:ftp_proxy   = 'http://spbsrv-proxy2.t-systems.ru:3128'
$env:http_proxy  = 'http://spbsrv-proxy2.t-systems.ru:3128'
$env:https_proxy = 'http://spbsrv-proxy2.t-systems.ru:3128'
```

3. Set up VM
```
vagrant up
```
