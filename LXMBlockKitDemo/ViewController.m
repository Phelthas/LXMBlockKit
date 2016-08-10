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


@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"it is dealloc %@", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testButton];
    
    [self testBarButtonItem];
    
    [self testGesture];
    
    [self testNotification];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testButton {
    
}

- (void)testBarButtonItem {
    __weak typeof(self) weakSelf = self;
    
    UIImage *testImage = [UIImage imageNamed:@"nav_setting"];
    
    
    UIBarButtonItem *oneItem = [UIBarButtonItem itemWithImage:testImage style:UIBarButtonItemStylePlain callback:^(UIBarButtonItem *sender) {
//        ViewController *testViewController = [[ViewController alloc] init];
//        [weakSelf.navigationController pushViewController:testViewController animated:YES];
        [weakSelf logDefault];
    }];
    
    UIBarButtonItem *twoItem = [UIBarButtonItem itemWithImage:testImage landscapeImagePhone:testImage style:UIBarButtonItemStylePlain callback:^(UIBarButtonItem *sender) {
        ViewController *testViewController = [[ViewController alloc] init];
        [weakSelf.navigationController pushViewController:testViewController animated:YES];
        [weakSelf logDefault];
    }];
    
    UIBarButtonItem *threeItem = [UIBarButtonItem itemWithTitle:@"third" style:UIBarButtonItemStylePlain callback:^(UIBarButtonItem *sender) {
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
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithCallback:^(UITapGestureRecognizer *sender) {
        [weakSelf logDefault];
        ViewController *testViewController = [[ViewController alloc] init];
        [weakSelf.navigationController pushViewController:testViewController animated:YES];
        
    }];
    [self.view addGestureRecognizer:tapGesture];
 
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

#pragma mark - tool

- (void)logDefault {
    NSLog(@"%s, line in %d， self is %@", __FUNCTION__, __LINE__, self);
    self.displayLabel.text = @"测试看看会不会释放";
}


@end
