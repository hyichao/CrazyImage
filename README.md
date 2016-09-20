# CrazyImage

[![CI Status](http://img.shields.io/travis/Charlie Huang/CrazyImage.svg?style=flat)](https://travis-ci.org/Charlie Huang/CrazyImage)
[![Version](https://img.shields.io/cocoapods/v/CrazyImage.svg?style=flat)](http://cocoapods.org/pods/CrazyImage)
[![License](https://img.shields.io/cocoapods/l/CrazyImage.svg?style=flat)](http://cocoapods.org/pods/CrazyImage)
[![Platform](https://img.shields.io/cocoapods/p/CrazyImage.svg?style=flat)](http://cocoapods.org/pods/CrazyImage)

## Motivation
While developing modules about images, we always need to convert image from one form to anthor, i.e. from UIImage to CGImage/CIImage, or more complex, from UIImage to char array, etc. 

Wait, why we need to turn it into char?? Here is a case. If we want to apply face detection while capturing camera buffer data, we may want to use [OpenCV](http://opencv.org) ([github](https://github.com/opencv/opencv)) or some stronger lib such as [dlib](http://dlib.net>) ([github](https://github.com/davisking/dlib)), which requires cv::Mat and therefore using char array is the cross-language solution between objc and c++.

Anyway, when I was working on this task, I found it very troublesome doing all the convertion, especially when I am comparing a lot of different face detection alrogithm...Before the task drive me **"crazy"**, I start this repo to mark some useful convertion of UIImage and some other data structures.

## Installation

<!--CrazyImage is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CrazyImage"
```-->

As I'm not sure if I make the codes perfect, I'm not gonna add it into Pod Repo. Thus, for installation, please try the following.

```ruby
pod "CrazyImage", :git => 'https://github.com/hyichao/CrazyImage.git'
```

## Usage
current version is very simple. When it grows complecated, I will make some follow-up on the "Usage" section.

## Author

Charlie Huang, hyichao@foxmail.com

## License

CrazyImage is available under the MIT license. See the LICENSE file for more info.
