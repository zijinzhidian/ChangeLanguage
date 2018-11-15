//
//  ViewController.m
//  ChangeLanguage
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 hzbojin. All rights reserved.
//

#import "ViewController.h"
#import "YWConfig.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

    NSLog(@"%@",[NSBundle allBundles]);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@",[defaults valueForKey:@"AppleLanguages"]);
    
    self.label.text = NSLocalizedString(@"text", nil);
}

- (IBAction)changeToChinese:(id)sender {
    [YWConfig setUserLanguage:@"zh-Hans"];
    
    [self refreshViewController];
}

- (IBAction)changeToEnglish:(id)sender {
    [YWConfig setUserLanguage:@"en"];
    
    [self refreshViewController];

}
- (IBAction)followSystem:(id)sender {
    [YWConfig setUserLanguage:nil];
    
    [self refreshViewController];
}

- (void)refreshViewController {
    ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}

@end
