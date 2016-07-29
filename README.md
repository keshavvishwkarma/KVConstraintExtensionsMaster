# KVConstraintExtensionsMaster

`KVConstraintExtensionsMaster` makes `auto layout constraint` much easier to use from code. It provides simple, more readable,  rich code reusability and powerful API for creating new, accessing, & modifying existing constraints by layout attribute.

Main motive of `KVConstraintExtensionsMaster` to reduce the overhead of developers while working with `NSLayoutConstraint` to produce `responsive UI(User Interface) design`.

[![CI Status](http://img.shields.io/travis/keshav vishwkarma/KVConstraintExtensionsMaster.svg?style=flat)](https://travis-ci.org/keshav vishwkarma/KVConstraintExtensionsMaster)
[![Version](https://img.shields.io/cocoapods/v/KVConstraintExtensionsMaster.svg?style=flat)](http://cocoapods.org/pods/KVConstraintExtensionsMaster)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/KVConstraintExtensionsMaster.svg?style=flat)](http://cocoapods.org/pods/KVConstraintExtensionsMaster)
[![Platform](https://img.shields.io/cocoapods/p/KVConstraintExtensionsMaster.svg?style=flat)](http://cocoapods.org/pods/KVConstraintExtensionsMaster)

## Installation

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift and Objective-C Cocoa projects.
 which automates and simplifies the process of using 3rd-party libraries in your projects.
 See the [Get Started](https://cocoapods.org/#get_started) section for more details.
 You can install it with the following command:

``` bash
$ sudo gem install cocoapods
```
#### Podfile

To integrate KVConstraintExtensionsMaster into your Xcode project using [CocoaPods](http://cocoapods.org), simply add the following line to your `Podfile`:

```ruby
pod "KVConstraintExtensionsMaster"
```
> If you are using `Swift`, be sure to add `use_frameworks!` in your `Podfile` and set your target to iOS 8+:

```
platform :ios, '8.0'
use_frameworks!
pod "KVConstraintExtensionsMaster"
```

Then, run the following command from Terminal:

```
$ pod install
```
You should open the `{Project}.xcworkspace` instead of the `{Project}.xcodeproj` after you installed anything from CocoaPods.

```
$ open *.xcworkspace 
```

### Installation with Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To install the carthage tool, you can use [Homebrew](http://brew.sh) or [Carthage.pkg](https://github.com/Carthage/Carthage/releases).

``` bash
$ brew update
$ brew install carthage
```
#### Cartfile

To integrate KVConstraintExtensionsMaster into your Xcode project using Carthage, specify it in your `Cartfile`:

``` ogdl
github "keshavvishwkarma/KVConstraintExtensionsMaster"
```

Then, run the following command to build the `KVConstraintExtensionsMaster` framework:
``` bash
$ carthage update
```
Now drag the built `KVConstraintExtensionsMaster.framework` into your Xcode project.

``` Manually ```
-----

- Drag and drop the KVConstraintExtensionsMaster folder into your project.
- Import the KVConstraintExtensionsMaster.h header file in class
```objective-c
#import "KVConstraintExtensionsMaster.h"
```
> If you are using Swift, you have to import the ```KVConstraintExtensionsMaster.h``` header file In the ```{Project}-Bridging-Heade.h``` header file.

## -----: Go Easy On Programatically Constraints :----
### ``` + Points ```

 - [x] No need to use more ``` IBOutlet reference ``` of the constraint instead of this you can directy access already applied constraint (means expected constraint) either applied ``` Programatically ``` or ``` Interface Builder ```on any view.

 - [x] You can easily add those constraints that are not ``` possible or very difficult from StoryBoard/xib```.

 - [x] Since Constraints are ``` cumulative ``` & do not override to each other. if you have an existing constraint, setting another constraint of the same type does not override the previous one. So ``` This library add any constraint only once ``` so you don't need to worry about what happened if we ``` add same ``` constraint many time.
 - [x] Easily ``` modify ``` any constraint and ``` replace ``` it with new constraint too.
 
 - [x] Easily ``` modify ``` any constraint with nice animation.
 
 - [x] you can easily ``` add Proportion/Ratio ``` constraints too in iOS 7,8,9 and later.
 
 - [x] you can ``` add multiple ``` constraints by writing few lines of code.

 - [x] All the methods of this library have prefixes ``` prepare ```or``` apply ``` according their behaviour. so you don't need to remember all methods just type method prefixes then ``` compiler automatically``` gives you ``` suggestions ``` for methods.

 A method which has prefixe ``` prepare ``` - is used to either prepare the constraint or prepare the view for the constraint.
 A method which has prefixe ``` apply ``` - is used to apply\add the constraint into its appropriate view.


``` 
##  ------: Just Two steps to Apply\Add constraints by programatically :------
```
  ``` Step 1 ``` Create & configure the view hierarchy for constraint first.
   
  ``` Step 2 ``` Apply the constraints by calling KVConstraintExtensionsMaster library methods which have prefix
                 ``` apply ``` according to constraints by selected view.
  
```
@interface ViewController ()
  
@property (strong, nonatomic) UIView *containerView;// may be any view like /*containerView*/

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.

    [self createAndConfigureViewHierarchy]; // Step 1
    [self applyConstaint];   // Step 2
}

- (void)createAndConfigureViewHierarchy
{
    self.containerView = [UIView prepareNewViewForAutoLayout];
    self.containerView.backgroundColor = [UIColor Purple];
    [self.view addSubview:self.containerView];
}

-(void)applyConstaint
{
    // Here we are going to apply constraints
    [self.containerView applyLeadingPinConstraintToSuperviewWithPadding:20];
    [self.containerView applyTrailingPinConstraintToSuperviewWithPadding:20];
    
    //  we can also apply leading and trailing of containerView both by using the below method. 
        But this method is only useful when both leading and trailing have same pading.
    // [self.containerView applyLeadingAndTrailingPinConstraintToSuperviewWithPadding:0];

    [self.containerView applyTopPinConstraintToSuperviewWithPadding:65.0f];
    [self.containerView applyBottomPinConstraintToSuperviewWithPadding:50.0f];
}

@end

```

## Author

Keshav Vishwkarma, keshavvbe@gmail.com

## License

KVConstraintExtensionsMaster is available under the MIT license. See the LICENSE file for more info.
