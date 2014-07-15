![Cocoa Pods Version](https://cocoapod-badges.herokuapp.com/v/UIViewController+BlockSegue/badge.png)
![Cocoa Pods Platform](https://cocoapod-badges.herokuapp.com/p/UIViewController+BlockSegue/badge.png)
[![Build Status](https://travis-ci.org/patoroco/UIViewController-BlockSegue.svg)](https://travis-ci.org/patoroco/UIViewController-BlockSegue)

Are you tired to write an ugly and big `-prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender:` method like that?

```objective-c

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue1"]) {
        UIViewController *destination = segue.destinationViewController;
        destination.view.backgroundColor = [UIColor redColor];
    } else if ([segue.identifier isEqualToString:@"segue2"]) {
        UIViewController *destination = segue.destinationViewController;
        destination.view.backgroundColor = [UIColor blueColor];
    } else if ([segue.identifier isEqualToString:@"segue3"]) {
        UIViewController *destination = segue.destinationViewController;
        destination.view.backgroundColor = [UIColor greenColor];
    }
    ...
}
```

Check UIViewController+BlockSegue and enjoy **defining a block** which will be executed to prepare segue **in the same place which you call to `performSegue`**.

**IMPORTANT:** if you override `-prepareForSegue:sender:` method, BlockSegue won't be performed in these UIViewController.


## Install

Use UIViewController+BlockSegue category it's really easy, you only need to drop `UIViewController+BlockSegue folder` to your project, or if you are a CocoaPods-lover, you can include this line in your Podfile as usual:

```
pod 'UIViewController+BlockSegue'
```
After that, you need to import `UIViewController+BlockSegue.h` on each view controller where you want to configure segues.

## Use

UIViewController+BlockSegue can be used in two ways: inline (when you performSegue programatically) or independently (in other line).


### Inline

Perform segue and configure the block which is executed in the same sentence.

```objective-c

[self performSegueWithIdentifier:@"segueIdentifier" sender:nil withBlock:^(id sender, id destinationVC, UIStoryboardSegue *segue) {
    NSLog(@"Segue configured inline");
    destinationVC.user = tmpUser;
}];
```


### Independently

Configure segue block independently of his execution, this way could be called on viewDidLoad for example, and it's run with both the call performSegueWithIdentifier:sender: method and storyboard segue perform.


```objective-c

[self configureSegue:@"segueIdentifier" withBlock:^(id sender, id destinationVC, UIStoryboardSegue *segue); {
    NSLog(@"I'm a block fired with the segue!");
}];
```

## Testing

I added some tests as personal exercise, but if you want run them, exec script (it uses [xcpretty by supermarin](https://github.com/supermarin/xcpretty)):

```
./run_tests.sh
```



## Acknowledges
- You can see a [list of contributors to this repo](https://github.com/patoroco/UIViewController-BlockSegue/graphs/contributors). Thanks to everybody!
- Special thanks to [@luisobo](https://github.com/luisobo) for support me with `runtime.h`, thanks buddy!.
- I found very useful the [NSHipster about method swizzling](http://nshipster.com/method-swizzling/).
- It was inspired by [UIAlertView-Blocks](https://github.com/ryanmaxwell/UIAlertView-Blocks), which helps you to write good-looking code with sad UIAlertView interface / delegates.


## Author
- Jorge Maroto ([@patoroco](http://twitter.com/patoroco)).

## License
`UIViewController+BlockSegue` is available under the MIT license. See the [LICENSE file](LICENSE.md) for more info.