//
//  WeatherViewController.m
//  Weather
//
//  Created by Alex_Bushmelev on 02.09.15.
//  Copyright (c) 2015 Alex_Bushmelev. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (id)init {
    self = [super init];
    if(self){
        self.title = @"Погода";
        self.tabBarItem.image = [UIImage imageNamed:@"Weather"];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.cityLabel = [[UILabel alloc] init];
    self.cityLabel.textAlignment = NSTextAlignmentCenter;
    self.cityLabel.font = [UIFont systemFontOfSize:30];
    self.cityLabel.frame = CGRectMake(20, 80, 280, 50);
    self.cityLabel.text = @"Москва";
    [self.view addSubview:self.cityLabel];
    
    self.weatherlabel = [[UILabel alloc] init];
    self.weatherlabel.textAlignment = NSTextAlignmentCenter;
    self.weatherlabel.font = [UIFont fontWithName:@"Helvetica-Light" size:180];
    self.weatherlabel.frame = CGRectMake(20, 150, 280, 250);
    self.weatherlabel.text = @"10°";
    [self.view addSubview:self.weatherlabel];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Город" style:UIBarButtonItemStyleBordered target:self action:@selector(chooseCity)];
}

- (void)cityChanged:(NSString *)city {
    self.cityLabel.text = city;
}

- (void)chooseCity {
    
    ChooseCityViewController *c = [[ChooseCityViewController alloc] init];
   
//    c.target = self;
//    c.action = @selector(cityChanged:);
    
    c.delegate = self;
    
    [self.navigationController pushViewController:c animated:YES];  // navigation
    //[self presentViewController:c animated:YES completion:nil];   // pop up
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)chooseCityDidSelectCity:(NSString *)city {
    self.cityLabel.text = city;
}


@end
