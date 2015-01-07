//
//  FirstViewController.h
//  AllWeatherApp
//
//  Created by F T on 26/12/2014.
//  Copyright (c) 2014 FT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *inpTxtField;

@property (strong, nonatomic) IBOutlet UILabel *cityName;

@property (weak, nonatomic) IBOutlet UILabel *cityWDesc;
@property (weak, nonatomic) IBOutlet UILabel *cityTemp;
@property (weak, nonatomic) IBOutlet UILabel *cityHumidity;
@property (weak, nonatomic) IBOutlet UILabel *cityWindSpeed;

@property (weak, nonatomic) IBOutlet UILabel *dateStrLabel;         // Label for Date

@end

