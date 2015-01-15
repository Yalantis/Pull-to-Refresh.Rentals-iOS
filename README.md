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

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
