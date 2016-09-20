//
//  ViewController.m
//  Threads
//
//  Created by Alex_Bushmelev on 05.09.15.
//  Copyright (c) 2015 Alex_Bushmelev. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //background
        //[NSThread sleepForTimeInterval:4];
        
        NSURL *url = [NSURL URLWithString:@"http://yabs.yandex.ru/resource/CZaANrQ4_HBxlaqI4ygxQk_banana_20141031_smart_watch.png"];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //main
            self.imageView.image = [[UIImage alloc] initWithData:data];
            self.label.text = @"Загружено";
        });
    });
}

@end








//dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//    });
//});