# QLImageset

QLImageset is a quicklook plugin that lets you preview package or directory with extension likes **`imageset`**, **`appiconset`** and **`launchimage`**. 

It also displays **the dimensions** using point coordinates of the image in the quicklook title bar.

## Installation

1. Download this package [QLImageset.qlgenerator.zip](http://const.qiniudn.com/repo/qlimageset/QLImageset.qlgenerator.zip)

2. Unpack it, copy or move the `QLImageset.qlgenerator` to the following path:

    ```
    /Library/QuickLook
    ```

    Tips: To quickly go to Finder, type `Shift + Cmd + G`. 

## Usage

**Selecte** the package or directory, then **Press** the **`SPACE`** key.

![preview](http://const.qiniudn.com/repo/qlimageset/preview.gif)

## TODO 
- [x] Support generating thumbnails.

## Uninstallation

Find and delete the following path:

```
/Library/QuickLook/QLImageset.qlgenerator
```

## Want to help
  
  * [Star this repository](https://github.com/qfish/XAlign/)
  * [Bugs Report & Advice](https://github.com/qfish/XAlign/issues)
  * [Fork & Pull Request](https://github.com/qfish/XAlign/pulls)

## Contributor
* [@qiaoxueshi](https://github.com/qiaoxueshi) Reviews the code.

## Trouble-Shooting
  
 * Run `qlmanage -r` in the Terminal. (This will restart QuickLook, which reloads all plugins.)
 * Type `Alt + Cmd + Esc`, relaunch the Finder. (This will restart Finder.)
   
## Special thanks to

* [![Geek-Zoo](http://geek-zoo.com/img/images/logo_2.png)](http://www.geek-zoo.com)

  They provide awesome design and development works continues to help the open-source community even better.


* [BeeFramework](https://github.com/gavinkwoe/BeeFramework) 

  BeeFramework is a new generation of development framework which makes faster and easier app development, Build your app by geek's way.
