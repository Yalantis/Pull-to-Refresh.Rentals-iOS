//
//  ViewController.m
//  YALRentalPullToRefresh
//
//  Created by Konstantin Safronov on 12/24/14.
//  Copyright (c) 2014 Konstantin Safronov. All rights reserved.
//

#import "YALExampleViewController.h"
#import "YALSunnyRefreshControl.h"

@interface YALExampleViewController ()

@property (nonatomic,strong) YALSunnyRefreshControl *sunnyRefreshControl;

@end

@implementation YALExampleViewController

# pragma mark - UIView life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupRefreshControl];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self.sunnyRefreshControl beginRefreshing];
}

# pragma mark - YALSunyRefreshControl methods

-(void)setupRefreshControl{
    
    self.sunnyRefreshControl = [YALSunnyRefreshControl attachToScrollView:self.tableView];
    [self.sunnyRefreshControl addTarget:self
                                 action:@selector(sunnyControlDidStartAnimation)
                       forControlEvents:UIControlEventValueChanged];
}

-(void)sunnyControlDidStartAnimation{
    // start loading something
}

-(IBAction)endAnimationHandle{
    
    [self.sunnyRefreshControl endRefreshing];
}

@end