//
//  SecondViewController.m
//  AllWeatherApp
//
//  Created by F T on 26/12/2014.
//  Copyright (c) 2014 FT. All rights reserved.
//

#import "SecondViewController.h"

#define     FDAY1   _forecastDay1.text
#define     FDAY2   _forecastDay2.text
#define     FDAY3   _forecastDay3.text
#define     FDAY4   _forecastDay4.text
#define     FDAY5   _forecastDay5.text

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupStartScreen];
    [self setup5DayForecast];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//#pragra mark 2nd Screen SetUp

-(void) setupStartScreen {
    
    UIColor *colour = [[UIColor alloc]initWithRed:67.0/255.0 green:62.0/255.0 blue:32.0/255.0 alpha:1.0];
    self.view.backgroundColor = colour;
    
    // Set up Todays date on main Sceen
    
}





-(void) setup5DayForecast {
    
    NSString *city = @"Dublin";  //NSString *city = _cityName.text;
    NSString *urlString   = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@,uk&cnt=5&units=metric&mode=json",city];
    // http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=1&mode=json
    
    
    NSURL *url            = [[NSURL alloc]initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response;
    NSData *GETReply      = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSDictionary *res     = [NSJSONSerialization JSONObjectWithData:GETReply options:NSJSONReadingMutableLeaves| NSJSONReadingMutableContainers error:nil];
    
  
    NSDictionary *list1 = res[@"list"][0];
    NSDictionary *list2 = res[@"list"][1];
    NSDictionary *list3 = res[@"list"][2];
    NSDictionary *list4 = res[@"list"][3];
    NSDictionary *list5 = res[@"list"][4];
    
    
    NSDictionary *forecastWeather1 = list1[@"weather"][0];
    NSDictionary *forecastWeather2  = list2[@"weather"][0];
    NSDictionary *forecastWeather3  = list3[@"weather"][0];
    NSDictionary *forecastWeather4  = list4[@"weather"][0];
    NSDictionary *forecastWeather5  = list5[@"weather"][0];
  
    NSString *forecastDay1 = forecastWeather1[@"description"];
    NSString *forecastDay2 = forecastWeather2[@"description"];
    NSString *forecastDay3 = forecastWeather3[@"description"];
    NSString *forecastDay4 = forecastWeather4[@"description"];
    NSString *forecastDay5 = forecastWeather5[@"description"];
    
    FDAY1=forecastDay1;
    FDAY2=forecastDay2;
    FDAY3=forecastDay3;
    FDAY4=forecastDay4;
    
    FDAY5=forecastDay5;
    
    
    
}







@end




