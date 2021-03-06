//
//  ViewController.m
//  LXMBlockKitDemo
//
//  Created by luxiaoming on 16/6/21.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import "ViewController.h"
#import "LXMBlockKit.h"
#import "objc/runtime.h"





@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (nonatomic, strong) NSOperationQueue *testQueue;

@property (nonatomic, strong) NSTimer *testTimer;


@end

@implementation ViewController

- (void)dealloc {
    
    NSLog(@"it is dealloc %@", self);
    [self.testTimer invalidate];
    self.testTimer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testButton];
    
    [self testBarButtonItem];
    
    [self testGesture];
    
    [self testNotification];
    
    [self testBlockTimer];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testButton {
    UIButton *testButton = [[UIButton alloc] init];
    [testButton addTarget:self action:@selector(handleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [testButton addButtonCallback:^(UIButton *sender) {
        NSLog(@"handleButtonTapped");
    }];
}

- (void)handleButtonTapped:(UIButton *)sender {
    NSLog(@"handleButtonTapped");
}

- (void)testBarButtonItem {
    __weak typeof(self) weakSelf = self;
    
    UIImage *testImage = [UIImage imageNamed:@"nav_setting"];
    
    
    UIBarButtonItem *oneItem = [UIBarButtonItem itemWithImage:testImage callback:^(UIBarButtonItem *sender) {
//        ViewController *testViewController = [[ViewController alloc] init];
//        [weakSelf.navigationController pushViewController:testViewController animated:YES];
        [weakSelf logDefault];
    }];
    
    UIBarButtonItem *twoItem = [UIBarButtonItem itemWithImage:testImage landscapeImagePhone:testImage callback:^(UIBarButtonItem *sender) {
        ViewController *testViewController = [[ViewController alloc] init];
        [weakSelf.navigationController pushViewController:testViewController animated:YES];
        [weakSelf logDefault];
    }];
    
    UIBarButtonItem *threeItem = [UIBarButtonItem itemWithTitle:@"third" callback:^(UIBarButtonItem *sender) {
        ViewController *testViewController = [[ViewController alloc] init];
        [weakSelf.navigationController pushViewController:testViewController animated:YES];
        [weakSelf logDefault];
    }];
    
    UIBarButtonItem *fourItem = [UIBarButtonItem itemWithBarButtonSystemItem:UIBarButtonSystemItemAdd callback:^(UIBarButtonItem *sender) {
        ViewController *testViewController = [[ViewController alloc] init];
        [weakSelf.navigationController pushViewController:testViewController animated:YES];
        [weakSelf logDefault];
    }];
    
    self.navigationItem.rightBarButtonItems = @[oneItem, twoItem, threeItem, fourItem];
}

- (void)testGesture {
    __weak typeof(self) weakSelf = self;
    [self.view addTapGestureWithCallback:^(UITapGestureRecognizer * _Nullable sender) {
        [weakSelf logDefault];
        ViewController *testViewController = [[ViewController alloc] init];
        [weakSelf.navigationController pushViewController:testViewController animated:YES];
    }];
    
 
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithCallback:^(UIPanGestureRecognizer *sender) {
        NSLog(@"it is %@", NSStringFromCGPoint([sender locationInView:weakSelf.view]));
    }];
    [self.view addGestureRecognizer:panGesture];

    
}

- (void)testNotification {
    
    __weak typeof(self) weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self name:UIApplicationDidEnterBackgroundNotification callback:^(NSNotification *sender) {
         NSLog(@"%@", sender.name);
    }];
    
//    UIApplicationWillResignActiveNotification
    [[NSNotificationCenter defaultCenter] addObserver:self name:UIApplicationWillResignActiveNotification callback:^(NSNotification *sender) {
        [weakSelf logDefault];
    }];
    
    
    [[NSNotificationCenter defaultCenter] lxm_removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];

    
//    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([UIButton class], &count);
//    for (int i = 0; i<count; i++) {
//        // 取出成员变量
//        Ivar ivar = *(ivars + i);
//        Ivar ivar2 = ivars[i];
//        // 打印成员变量名字
//        NSLog(@"%s------%s", ivar_getName(ivar),ivar_getTypeEncoding(ivar2));
//    }
}

- (void)testBlockTimer {
    
    __weak typeof(self) weakSelf = self;
    
    self.testTimer = [NSTimer lxm_scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nullable sender) {
         [weakSelf logDefault];
    }];
    
    [[NSRunLoop mainRunLoop] addTimer:self.testTimer forMode:NSRunLoopCommonModes];
}

#pragma mark - tool

- (void)logDefault {
    NSLog(@"%s, line in %d， self is %@", __FUNCTION__, __LINE__, self);
    self.displayLabel.text = @"测试看看会不会释放";
}


@end
