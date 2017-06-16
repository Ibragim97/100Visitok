//
//  MenuViewController.m
//  My project
//
//  Created by user on 06.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "MenuViewController.h"
#import "MySingleton.h"


#define DATA_KEY @"datakey"

#define FONT @"Futura"
#define FONT_BOLD @"Futura-CondensedExtraBold"
#define FONT_Italic @"Futura-MediumItalic"

#define blackColor [UIColor blackColor]
#define whiteColor [UIColor whiteColor]
#define blueC  [UIColor colorWithRed:38/255.0 green:140/255.0 blue:204/255.0 alpha:1.0]
#define grey  [UIColor colorWithRed:193/255.0 green:191/255.0 blue:191/255.0 alpha:1.0]
#define pink  [UIColor colorWithRed:234/255.0 green:40/255.0 blue:110/255.0 alpha:1.0]


@interface MenuViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *check;

@property (nonatomic) UIView *imageView;
@property (nonatomic) UIImageView *background;

@property (nonatomic) UILabel *fullName;
@property (nonatomic) UILabel *nameAndSurname;
@property (nonatomic) UILabel *patronymicName;
@property (nonatomic) UILabel *ocupation;
@property (nonatomic) UILabel *adress;
@property (nonatomic) UILabel *phoneNumber;
@property (nonatomic) UILabel *email;
@property (nonatomic) UILabel *companyName;
@property (nonatomic) UILabel *website;

@property (nonatomic) integer_t width, height;
@property (nonatomic) CGFloat startX;
@property (nonatomic) NSTextAlignment textAlignment;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fillSingleton];
    
    self.width = 1440;
    self.height = 800;
    
    self.imageView = [UIView new];
    self.imageView.frame = CGRectMake(5, 100, self.width, self.height);
    self.imageView.backgroundColor = [UIColor blueColor];
    
    self.background = [UIImageView new];
    self.background.frame = CGRectMake(0, 0, self.width, self.height);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fillLabels];
    
    [self makeImage1];
    [self makeImage2];
    [self makeImage3];
    [self makeImage4];
    [self makeImage5];
    
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) makeImage1
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"image1"];
    [self.imageView addSubview: self.background];
 
    self.startX = 0;
    self.textAlignment = NSTextAlignmentCenter;

    [self show: self.fullName    textColor: blackColor Fontsize: 75 location: 146  lineHeight: 104 lineWidth: self.width  fontType: 1];
    [self show: self.ocupation   textColor: blackColor Fontsize: 64 location: 402 lineHeight: 80   lineWidth: self.width  fontType: 2];
    [self show: self.adress      textColor: blackColor Fontsize: 48 location: 462 lineHeight: 80   lineWidth: self.width  fontType: 3];
    [self show: self.phoneNumber textColor: blackColor Fontsize: 48 location: 522 lineHeight: 80   lineWidth: self.width  fontType: 3];
    [self show: self.email       textColor: blackColor Fontsize: 48 location: 582 lineHeight: 80   lineWidth: self.width  fontType: 3];
    
    sharedManager.image1 = [MenuViewController imageWithView: self.imageView];
}

-(void) makeImage2
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"image2"];
    [self.imageView addSubview: self.background];
    
    self.startX = 72;
    self.textAlignment = NSTextAlignmentLeft;
    
    [self show: self.fullName    textColor: whiteColor Fontsize: 64 location: 41   lineHeight: 104 lineWidth: self.width fontType: 4];
    [self show: self.ocupation   textColor: whiteColor Fontsize: 56 location: 457  lineHeight: 80  lineWidth: self.width fontType: 4];
    [self show: self.adress      textColor: whiteColor Fontsize: 56 location: 527  lineHeight: 80  lineWidth: self.width fontType: 4];
    [self show: self.phoneNumber textColor: whiteColor Fontsize: 56 location: 597  lineHeight: 80  lineWidth: self.width fontType: 4];
    [self show: self.email       textColor: whiteColor Fontsize: 56 location: 667  lineHeight: 80  lineWidth: self.width fontType: 4];
    
    sharedManager.image2 = [MenuViewController imageWithView: self.imageView];
}

-(void) makeImage3
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"image3"];

    [self.imageView addSubview: self.background];
    
    self.startX = 0;
    self.textAlignment = NSTextAlignmentCenter;
    
    [self show: self.nameAndSurname textColor: whiteColor Fontsize: 60 location: 161  lineHeight: 104 lineWidth: self.width fontType: 4];
    [self show: self.patronymicName textColor: whiteColor Fontsize: 60 location: 231  lineHeight: 104 lineWidth: self.width fontType: 4];
    [self show: self.ocupation      textColor: blackColor Fontsize: 60 location: 321  lineHeight: 80  lineWidth: self.width fontType: 4];
    [self show: self.email          textColor: whiteColor Fontsize: 48 location: 421  lineHeight: 80  lineWidth: self.width fontType: 4];
    [self show: self.phoneNumber    textColor: whiteColor Fontsize: 48 location: 477  lineHeight: 80  lineWidth: self.width fontType: 4];
    [self show: self.website    textColor: whiteColor Fontsize: 48 location: 533  lineHeight: 80  lineWidth: self.width fontType: 4];
    
    sharedManager.image3 = [MenuViewController imageWithView: self.imageView];
}

-(void) makeImage4
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"image4"];
    [self.imageView addSubview: self.background];
    
    self.startX = 295;
    self.textAlignment = NSTextAlignmentRight;
    [self show: self.fullName    textColor: blueC Fontsize: 64 location: 40   lineHeight: 104 lineWidth: self.width - 405  fontType: 6];
    [self show: self.ocupation   textColor: blueC Fontsize: 52 location: 120   lineHeight: 80  lineWidth: self.width - 405  fontType: 5];
    self.textAlignment = NSTextAlignmentLeft;
    [self show: self.email       textColor: blueC Fontsize: 48 location: 260  lineHeight: 80  lineWidth: self.width  fontType: 5];
    [self show: self.phoneNumber textColor: blueC Fontsize: 48 location: 327  lineHeight: 80  lineWidth: self.width  fontType: 5];
    [self show: self.website     textColor: blueC Fontsize: 48 location: 392  lineHeight: 80  lineWidth: self.width  fontType: 5];
    
    sharedManager.image4 = [MenuViewController imageWithView: self.imageView];
}

-(void) makeImage5
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"image5"];
    [self.imageView addSubview: self.background];
    
    self.startX = 90;
    self.textAlignment = NSTextAlignmentLeft;
    [self show: self.fullName    textColor: pink  Fontsize: 64    location: 390   lineHeight: 104 lineWidth: self.width  fontType: 6];
    
    [self show: self.ocupation   textColor: grey  Fontsize: 48    location: 475   lineHeight: 80  lineWidth: self.width  fontType: 5];
    [self show: self.phoneNumber textColor: grey  Fontsize: 48    location: 570   lineHeight: 80  lineWidth: self.width  fontType: 5];
    [self show: self.website     textColor: grey  Fontsize: 48    location: 630   lineHeight: 80  lineWidth: self.width  fontType: 5];
    [self show: self.email       textColor: grey  Fontsize: 48    location: 690   lineHeight: 80  lineWidth: self.width  fontType: 5];

    sharedManager.image5 = [MenuViewController imageWithView: self.imageView];
    
//    self.check.image = sharedManager.image5;
}




-(void) show:(UILabel *) label  textColor: (UIColor *) color Fontsize:(CGFloat) fontsize location: (CGFloat) Y lineHeight: (CGFloat) lineHeight  lineWidth: (CGFloat) lineWidth fontType:(integer_t)type
{
    label.frame = CGRectMake(self.startX, Y, lineWidth, lineHeight);
    label.textColor = color;
    
 //     label.backgroundColor = [UIColor colorWithRed:19/255.0 green:178/255.0 blue:124/255.0 alpha:1.0];
    
    label.textAlignment = self.textAlignment;
    
    if(type == 1)
        label.font = [UIFont fontWithName: FONT_BOLD size: fontsize];
    else if(type == 2)
        label.font = [UIFont fontWithName: FONT_Italic size: fontsize];
    else if (type == 3)
        label.font = [UIFont fontWithName: FONT size: fontsize];
    else if(type == 4)
        label.font = [UIFont fontWithName: @"Georgia" size: fontsize];
    else if(type == 5)
        label.font = [UIFont fontWithName: @"Palatino" size: fontsize];
    else if(type == 6)
        label.font = [UIFont fontWithName: @"Palatino-Bold" size: fontsize];
    
    
    
    [self.imageView addSubview: label];
}

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

-(void) fillLabels
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.fullName = [UILabel new];
    self.nameAndSurname = [UILabel new];
    self.patronymicName = [UILabel new];
    self.email = [UILabel new];
    self.ocupation = [UILabel new];
    self.adress = [UILabel new];
    self.phoneNumber = [UILabel new];
    self.companyName = [UILabel new];
    self.website = [UILabel new];
    
    self.fullName.text = [NSString stringWithFormat: @"%@ %@ %@", sharedManager.surname, sharedManager.name, sharedManager.patronymicName];
    self.nameAndSurname.text = [NSString stringWithFormat: @"%@ %@", sharedManager.surname, sharedManager.name];
    self.patronymicName.text = sharedManager.patronymicName;
    self.website.text = sharedManager.website;
    self.ocupation.text = sharedManager.ocupation;
    self.adress.text = sharedManager.adress;
    self.phoneNumber.text = sharedManager.phoneNumber;
    self.email.text = sharedManager.email;
    self.companyName.text = sharedManager.companyName;
}

- (void) fillSingleton
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    NSArray *dicts = [[NSUserDefaults standardUserDefaults] arrayForKey:DATA_KEY];
    
    sharedManager.surname = dicts[0];
    
    sharedManager.name = dicts[1];
    sharedManager.patronymicName = dicts[2];
    sharedManager.email = dicts[3];
    sharedManager.phoneNumber = dicts[4];
    sharedManager.companyName = dicts[5];
    sharedManager.ocupation = dicts[6];
    sharedManager.adress = dicts[7];
    sharedManager.website = dicts[8];
}



@end
