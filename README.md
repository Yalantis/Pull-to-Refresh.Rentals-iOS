# Pull-to-Refresh.Rentals-IOS

This project aims to provide a simple and customizable pull to refresh implementation. Made in [Yalantis] (http://yalantis.com/)

Check this [project on Dribbble] (https://dribbble.com/shots/1650317-Pull-to-Refresh-Rentals)  
Check this [project on Behance] (https://www.behance.net/gallery/20411445/Mobile-Animations-Interactions)  

<img src="https://d13yacurqjgara.cloudfront.net/users/125056/screenshots/1650317/realestate-pull_1-2-3.gif" alt="alt text" style="width:200;height:200">

#Usage

*For a working implementation, Have a look at the Sample Project - sample*

1. Add folder YALSunnyRefreshControll to your project.
2. Implement header and setup YALSunnyRefreshControl as a property.
3. Init and associate YALSunnyRefreshControl with your UITableView or UICollectionView.
4. Add images from Images.xcassets folder in Sample Project.

```objective-c
#import "YALSunnyRefreshControl.h"

@property (nonatomic,strong) YALSunnyRefreshControl *sunnyRefreshControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRefreshControl];
}

-(void)setupRefreshControl{
    
    self.sunnyRefreshControl = [YALSunnyRefreshControl attachToScrollView:self.tableView
                                                                  target:self
                                                           refreshAction:@selector(sunnyControlDidStartAnimation)];
    
}

-(void)sunnyControlDidStartAnimation{
    
    // start loading something
}

-(IBAction)endAnimationHandle{
    
    [self.sunnyRefreshControl endRefreshing];
}

```

#Customization

To customize drawables you can change:
   * sun.png - Sun image
   * sky.png - background image
   * buildings.png - foreground image

#Compatibility
  
  * IOS 7,8
  
# Changelog

### Version: 1.0

  * Initial Build
  
## License

Copyright 2015, Yalantis

The MIT License (MIT)
 
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


