# power-theme

a easy to use powershell theme manager

## installation

### how to install
this project is currently in BETA. You need to manually clone to your local module folder.

```
git clone https://github.com/chantisnake/power-theme $($env:PSModulePath -split ';')[0]
```

In the future, [chocolatey](https://chocolatey.org/), [psGet](http://psget.net/), and install script will be supported

### dependency

[posh-git](https://github.com/dahlbyk/posh-git) is required for git status, 
in the future there will be a feature to disable git status.

[conemu](http://conemu.github.io/) and [PSReadLine](http://conemu.github.io/) is recommended for an even more gorgeous powershell

## feature

* manage your theme in your `$PROFILE`, with simply `Enable-Theme ys`.
* customize the theme you use with `$Global:THEME` variable
* create you custom theme to contribute to the powershell community.

## screenshot

enable the theme with one single command
![](https://github.com/chantisnake/power-theme/raw/master/screenshots/customizePath/enableTheme.png)
---

customize the displayed path
![](https://github.com/chantisnake/power-theme/raw/master/screenshots/customizePath.png)
---

change the path back to default: just setting it to anything that can be cast to `$false`
![](https://github.com/chantisnake/power-theme/raw/master/screenshots/pathToDefault.png)
---

customize the displayed date time, with the same rule as `Format` parameter in `Get-Date` function
![](https://github.com/chantisnake/power-theme/raw/master/screenshots/customizeTime.png)