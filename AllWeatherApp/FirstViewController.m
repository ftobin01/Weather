//
//  FirstViewController.m
//  AllWeatherApp
//
//  Created by F T on 26/12/2014.
//  Copyright (c) 2014 FT. All rights reserved.
//

#import "FirstViewController.h"
#import "WTime.h"


#define     FIRSTINPUT        _inpTxtField
#define     FIRSTLABEL        _cityName.text

#define     CITYNAME          _cityName
#define     CITYWDESC         _cityWDesc
#define     CITYTEMP          _cityTemp
#define     CITYHUMIDITY      _cityHumidity
#define     CITYWINDSPEED     _cityWindSpeed
#define     CITYICON          _cityIcon


@interface FirstViewController ()

@property (weak,nonatomic) NSString *cityIcon;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupStartScreen];  // Set up first screen  colour
    [self setupFirstInput];    //Get Firstinput
   
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ----------------------- Get city weather  details



- (void) getCityWeather  {
    
    // The Openweathermap JSON responder
    // When city called with ','  gives just 1 answer closest to location
    NSString *urlString   = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@,&units=metric&mode=json",CITYNAME.text];
  
    NSURL *url            = [[NSURL alloc]initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response;
    NSData *GETReply      = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSDictionary *res     = [NSJSONSerialization JSONObjectWithData:GETReply options:NSJSONReadingMutableLeaves| NSJSONReadingMutableContainers error:nil];
    
    // Set Up Variables From Data For Screen
    NSDictionary *dict2 = [res objectForKey:@"main"];
    CITYTEMP.text = [NSString stringWithFormat:@"%@",[dict2 objectForKey:@"temp" ]];
    CITYHUMIDITY.text = [NSString stringWithFormat:@"%@",[dict2 objectForKey:@"humidity" ]];
    NSDictionary *dict3 = [res objectForKey:@"wind" ];
    CITYWINDSPEED.text =[NSString stringWithFormat:@"%@",[dict3 objectForKey:@"speed" ]];
    
    NSDictionary *dict4 = res[@"weather"][0];
    CITYWDESC.text = [NSString stringWithFormat:@"%@",[dict4 objectForKey:@"description" ]];


    // Save ICON strng to retrieve Weather Graphic
    CITYICON = [NSString stringWithFormat:@"%@",[dict4 objectForKey:@"icon" ]];
    
}

#pragma mark Get   icon for weather conditions

- (void) getIconPicture {
    NSString *icon = CITYICON;

    NSString *urlString2   = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@",icon];
    NSURL *url2            = [[NSURL alloc]initWithString:urlString2];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    NSURLResponse *response2;
    NSData *GETReply2      = [NSURLConnection sendSynchronousRequest:request2 returningResponse:&response2 error:nil];
    NSDictionary *res2     = [NSJSONSerialization JSONObjectWithData:GETReply2 options:NSJSONReadingMutableLeaves| NSJSONReadingMutableContainers error:nil];



    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url2]];
    UIImage *image = [[UIImage alloc] initWithData:imageData];

    //_iconViewButton setImage:image forState:UIControlStateNormal];

    //_iconView=image;

}



#pragma mark ------------------------Screen setUp

-(void) setupStartScreen {
    
    UIColor *colour = [[UIColor alloc]initWithRed:77.0/255.0
                                            green:60.0/255.0
                                             blue:32.0/255.0
                                            alpha:1.0];
    
    self.view.backgroundColor = colour;
    
    // Set up Todays date on main Sceen
   
    WTime *wtime =[[WTime alloc] init];
    NSString *dateNow = [wtime getDateStringFromDate];
    _dateStrLabel.text= dateNow;
   
    }

#pragma mark ------------------------Input routines for Focusa and  Assignment


- (void)hideKeyboard {
    
    [FIRSTINPUT resignFirstResponder];
    //Custom hide keyboard action
}



- (void)textFieldDidEndEditing:(UITextField *) FIRSTINPUT{
    
    FIRSTLABEL = [self getFirstInput];
    // NSString *enteredText = [FirstInput getFirstInput];
    
    CITYNAME.text = FIRSTLABEL;
    [self getCityWeather];
}






-(void)  setupFirstInput {
    [FIRSTINPUT becomeFirstResponder];
    FIRSTINPUT.delegate = self;
    FIRSTINPUT.returnKeyType = UIReturnKeyDone;
    //Call hideKeyboard action when done button is clicked
    [FIRSTINPUT addTarget:self action:@selector(hideKeyboard) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    // Sets up Focus for First Input
    //  Input Assigned in textFieldDidEndEditing
    
    
}

- (NSString *) getFirstInput {
    
    return([FIRSTINPUT text] );
}




@end
