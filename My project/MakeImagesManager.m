//
//  MakeImagesViewController.m
//  My project
//
//  Created by user on 29.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "MakeImagesManager.h"
#import "MySingleton.h"

@interface MakeImagesManager ()

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
@property (nonatomic) UILabel *emailAndWebsite;

@property (nonatomic) integer_t width, height, frameWidth;
@property (nonatomic) CGFloat startX;
@property (nonatomic) NSTextAlignment textAlignment;
@property (nonatomic) UIColor *color1;
@property (nonatomic) UIColor *color2;
@property (nonatomic) UIColor *color3;

@end

@implementation MakeImagesManager

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    self.imageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1440, 800)];
    
    return self;
}

-(UIImage *)check1
{
    self.background.image = [UIImage imageNamed: @"0-1"];
    [self.imageView addSubview: self.background];
    
    return self.background.image;
}

-(UIImage *) makeImage0_1
{
//    [self checkFonts];
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"0-1"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor colorWithRed:[self RC:35] green: [self RC:31] blue:[self RC:32] alpha: 1.0];
    self.color2 = [UIColor colorWithRed:[self RC:101] green: [self RC:98] blue:[self RC:99] alpha: 1.0];
    
    self.startX = 50;

    self.textAlignment = NSTextAlignmentLeft;
    [self show: self.companyName textColor:self.color1 Fontsize: 56 location:329  lineHeight: 76 lineWidth:self.width fontType: @"Ubuntu-Bold"];
    [self show: self.fullName    textColor:self.color2 Fontsize: 52 location:415  lineHeight: 71 lineWidth:self.width fontType: @"Ubuntu-Medium"];
    [self show: self.ocupation   textColor:self.color1 Fontsize: 52 location:492  lineHeight: 71 lineWidth:self.width fontType: @"Ubuntu-Medium"];
    
    self.textAlignment = NSTextAlignmentRight;
    [self show: self.phoneNumber textColor:self.color2 Fontsize: 48 location:522  lineHeight: 66 lineWidth:self.width - 100 fontType: @"Ubuntu-Medium"];
    [self show: self.email       textColor:self.color2 Fontsize: 48 location:598  lineHeight: 66 lineWidth:self.width - 100 fontType: @"Ubuntu-Medium"];
    [self show: self.website     textColor:self.color1 Fontsize: 48 location:674  lineHeight: 66 lineWidth:self.width - 100 fontType: @"Ubuntu-Medium"];
        
    return [MakeImagesManager imageWithView: self.imageView];
}
-(UIImage *) makeImage0_1b
{
   self.background.image = [UIImage imageNamed: @"0-1b"];
    [self.imageView addSubview: self.background];
   return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage0_2
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"0-2"];
    self.color1 = [UIColor blackColor];
    self.startX = 130;
    
    self.textAlignment = NSTextAlignmentCenter;
    [self show: self.fullName    textColor:self.color1 Fontsize: 76 location:301  lineHeight: 87 lineWidth:self.width - 2 * self.startX fontType: @"TimesNewRomanPS-BoldMT"];
    [self show: self.email      textColor:self.color1 Fontsize: 42 location:619  lineHeight: 52 lineWidth:self.width - 2 * self.startX fontType: @"Superclarendon-Light"];
    [self show: self.phoneNumber textColor:self.color1 Fontsize: 42 location:681  lineHeight: 52 lineWidth:self.width - 2 * self.startX fontType: @"Superclarendon-Light"];
    
    return [MakeImagesManager imageWithView: self.imageView];
}
-(UIImage *) makeImage0_2b
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"0-2b"];
    [self.imageView addSubview: self.background];
    

    NSString *text1 = [NSString stringWithFormat: @"%@%@", ([sharedManager.surname length] > 0 ? [sharedManager.surname substringWithRange:NSMakeRange(0, 1)] : @""), ([sharedManager.name length] > 0 ? [sharedManager.name substringWithRange:NSMakeRange(0, 1)] : @"")];

    NSString *text2 = self.fullName.text;
    self.fullName.text = text1;
    self.startX = 610;
    
    [self show: self.fullName    textColor: [UIColor blackColor] Fontsize: 100 location:312  lineHeight: 127 lineWidth:self.width - 2 * self.startX fontType: @"TimesNewRomanPS-BoldMT"];
    
    UIImage *imageSnapshot = [MakeImagesManager imageWithView: self.imageView];
    
    self.fullName.text = text2;
    return imageSnapshot;
}

-(UIImage *) makeImage0_3
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"0-3"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor colorWithRed:[self RC:199] green: [self RC:20] blue:[self RC:126] alpha: 1.0];
    self.color2 = [UIColor colorWithRed:[self RC:101] green: [self RC:98] blue:[self RC:99] alpha: 1.0];
    
    self.startX = 79.5;
    self.textAlignment = NSTextAlignmentLeft;
    NSString *font = @"DIN30640NeuzeitGrotesk-Light";
    
    [self show: self.companyName textColor:self.color1 Fontsize: 57 location:178  lineHeight: 66 lineWidth:self.width fontType: font];
    [self show: self.ocupation   textColor:self.color2 Fontsize: 42 location:258  lineHeight: 96 lineWidth:self.width fontType: font];
    [self show: self.adress      textColor:self.color2 Fontsize: 42 location:422  lineHeight: 66 lineWidth:self.width fontType: font];
    [self show: self.phoneNumber textColor:self.color2 Fontsize: 42 location:481  lineHeight: 66 lineWidth:self.width fontType: font];
    [self show: self.email       textColor:self.color2 Fontsize: 42 location:591  lineHeight: 66 lineWidth:self.width fontType: font];
    [self show: self.website     textColor:self.color2 Fontsize: 42 location:649  lineHeight: 66 lineWidth:self.width fontType: font];
    
    return [MakeImagesManager imageWithView: self.imageView];
}
-(UIImage *) makeImage0_3b
{
    self.background.image = [UIImage imageNamed: @"0-3b"];
    [self.imageView addSubview: self.background];
    return [MakeImagesManager imageWithView: self.imageView];
}
-(UIImage *) makeImage0_4
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.background.image = [UIImage imageNamed: @"0-4"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor blackColor];
    self.color2 = [UIColor whiteColor];
    
    self.startX = 0;
    self.textAlignment = NSTextAlignmentCenter;
    NSString *font = @"AppleGaramond-Bold";
    
    [self show: self.fullName    textColor:self.color1 Fontsize: 62 location:228.5  lineHeight: 77   lineWidth:self.width fontType: font];
    [self show: self.ocupation   textColor:self.color1 Fontsize: 42 location:328.5  lineHeight: 55.1 lineWidth:self.width fontType: font];
    [self show: self.phoneNumber textColor:self.color1 Fontsize: 46 location:423.5  lineHeight: 55.1 lineWidth:self.width fontType: font];
    [self show: self.email       textColor:self.color1 Fontsize: 46 location:478.5  lineHeight: 55.1 lineWidth:self.width fontType: font];
    [self show: self.website     textColor:self.color1 Fontsize: 46 location:533.5  lineHeight: 55.1 lineWidth:self.width fontType: font];

    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage0_4b
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    self.background.image = [UIImage imageNamed: @"0-4b"];
    [self.imageView addSubview: self.background];
  
    NSString *text1 = [NSString stringWithFormat: @"%@.%@.%@", ([sharedManager.surname length] > 0 ? [sharedManager.surname substringWithRange:NSMakeRange(0, 1)] : @""), ([sharedManager.name length] > 0 ? [sharedManager.name substringWithRange:NSMakeRange(0, 1)] : @""), ([sharedManager.patronymicName length] > 0 ? [sharedManager.patronymicName substringWithRange:NSMakeRange(0, 1)] : @"")];
    NSString *text2 = self.fullName.text;
    
    self.fullName.text = text1;
    
    [self show: self.fullName    textColor: [UIColor whiteColor] Fontsize: 200 location:257.61  lineHeight: 240 lineWidth:self.width fontType: @"Futura-MediumItalic"];
    
    UIImage *imageSnapshot = [MakeImagesManager imageWithView: self.imageView];
    
    self.fullName.text = text2;
    return imageSnapshot;
}

-(UIImage *) makeImage1_1
{
    self.background.image = [UIImage imageNamed: @"1-1"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor colorWithRed:[self RC:137] green: [self RC:96] blue:[self RC:179] alpha: 1.0];
    self.color2 = [UIColor colorWithRed:[self RC:73] green: [self RC:72] blue:[self RC:70] alpha: 1.0];
    
    self.startX = 80;
    self.textAlignment = NSTextAlignmentLeft;
    NSString *font = @"BookmanOldStyle";
    NSString *font2 = @"BodoniSvtyTwoOSITCTT-Book";
    
    [self show: self.companyName textColor:self.color1 Fontsize: 62 location:178  lineHeight: 72 lineWidth:self.width fontType: font];
    [self show: self.fullName    textColor:self.color2 Fontsize: 37 location:313  lineHeight: 44 lineWidth:self.width fontType: font];
    [self show: self.ocupation   textColor:self.color2 Fontsize: 37 location:372  lineHeight: 44 lineWidth:self.width fontType: font];
    [self show: self.phoneNumber textColor:self.color2 Fontsize: 37 location:514  lineHeight: 44 lineWidth:self.width fontType: font];
    [self show: self.adress      textColor:self.color2 Fontsize: 37 location:573  lineHeight: 44 lineWidth:self.width fontType: font];
    [self show: self.website     textColor:self.color2 Fontsize: 37 location:632  lineHeight: 44 lineWidth:self.width fontType: font];
    
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage1_1b
{
    self.background.image = [UIImage imageNamed: @"1-1b"];
    [self.imageView addSubview: self.background];
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage1_2
{
    self.background.image = [UIImage imageNamed: @"1-2"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor whiteColor];
    self.color2 = [UIColor blackColor];
    
    self.startX = 50;
    self.textAlignment = NSTextAlignmentRight;
    NSString *font = @"Lato-Regular";
    NSString *font2 = @"NautilusPompilius";
    
    [self show: self.ocupation   textColor:self.color2 Fontsize: 50 location:496  lineHeight: 60 lineWidth:self.width - 2 *self.startX fontType: font];
    [self show: self.adress      textColor:self.color2 Fontsize: 50 location:562  lineHeight: 60 lineWidth:self.width - 2 *self.startX fontType: font];
    [self show: self.phoneNumber textColor:self.color2 Fontsize: 50 location:627  lineHeight: 60 lineWidth:self.width - 2 *self.startX fontType: font];
    [self show: self.email       textColor:self.color2 Fontsize: 50 location:692  lineHeight: 60 lineWidth:self.width - 2 *self.startX fontType: font];
    
    self.textAlignment = NSTextAlignmentCenter;
    [self show: self.companyName    textColor:self.color1 Fontsize: 80 location:200  lineHeight: 162 lineWidth:self.width - 2 * self.startX fontType: font2];
    self.companyName.transform = CGAffineTransformMakeRotation(-15 * 3.14 / 180);
    
 //   self.companyName.text = @"Ильясов Ибрахим Темиргалиулы";
    UIImage *imageSnapShot = [MakeImagesManager imageWithView: self.imageView];
    
    self.companyName.transform = CGAffineTransformMakeRotation(0);
    
    return imageSnapShot;
}

-(UIImage *) makeImage1_2b
{
    self.background.image = [UIImage imageNamed: @"1-2b"];
    [self.imageView addSubview: self.background];
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage2_1
{
    self.background.image = [UIImage imageNamed: @"2-1"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor colorWithRed:[self RC:101] green: [self RC:98] blue:[self RC:99] alpha: 1.0];
    self.color2 = [UIColor colorWithRed:[self RC:233] green: [self RC:233] blue:[self RC:233] alpha: 1.0];
    
    self.startX = 75;
    self.frameWidth = self.width - 2 * self.startX;

    NSString *font1 = @"Lato-Light";
    NSString *font2 = @"Lato-MediumItalic";
    NSString *font3 = @"Lato-Regular";
    
    self.textAlignment = NSTextAlignmentRight;
    [self show: self.nameAndSurname    textColor:self.color1 Fontsize: 120 location:60 lineHeight: 144  lineWidth:self.frameWidth fontType: font1];
    [self show: self.ocupation   textColor:self.color2 Fontsize: 40  location:255   lineHeight: 48   lineWidth:self.frameWidth fontType: font2];

    self.textAlignment = NSTextAlignmentLeft;
    [self show: self.phoneNumber     textColor:self.color2 Fontsize: 42 location:572  lineHeight: 50 lineWidth:self.frameWidth fontType: font3];
    [self show: self.emailAndWebsite textColor:self.color2 Fontsize: 42 location:627  lineHeight: 50 lineWidth:self.frameWidth fontType: font3];
    [self show: self.adress          textColor:self.color2 Fontsize: 42 location:682  lineHeight: 50 lineWidth:self.frameWidth fontType: font3];
    
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage2_1b
{
    self.background.image = [UIImage imageNamed: @"2-1b"];
    [self.imageView addSubview: self.background];
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage2_2
{
    self.background.image = [UIImage imageNamed: @"2-2"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor colorWithRed:[self RC:234] green: [self RC:40] blue:[self RC:110] alpha: 1.0];
    self.color2 = [UIColor colorWithRed:[self RC:193] green: [self RC:191] blue:[self RC:191] alpha: 1.0];
    
    NSString *font1 = @"Palatino-Bold";
    NSString *font2 = @"Palatino";
    
    self.startX = 85;
    self.textAlignment = NSTextAlignmentLeft;
    [self show: self.fullName    textColor: self.color1  Fontsize: 64    location: 365   lineHeight: 104 lineWidth: self.width  fontType: font1];
    
    [self show: self.ocupation   textColor: self.color2  Fontsize: 48    location: 460   lineHeight: 80  lineWidth: self.width  fontType: font2];
    [self show: self.phoneNumber textColor: self.color2  Fontsize: 48    location: 570   lineHeight: 80  lineWidth: self.width  fontType: font2];
    [self show: self.website     textColor: self.color2  Fontsize: 48    location: 630   lineHeight: 80  lineWidth: self.width  fontType: font2];
    [self show: self.email       textColor: self.color2  Fontsize: 48    location: 690   lineHeight: 80  lineWidth: self.width  fontType: font2];
    
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage2_2b
{
    self.background.image = [UIImage imageNamed: @"2-2b"];
    [self.imageView addSubview: self.background];
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage8_1
{
    self.background.image = [UIImage imageNamed: @"8-1"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor colorWithRed:[self RC:236] green: [self RC:48] blue:[self RC:57] alpha: 1.0];
    self.color2 = [UIColor colorWithRed:[self RC:35] green: [self RC:31] blue:[self RC:32] alpha: 1.0];
    
    NSString *font1 = @"MetaPro-Normal";
    
    self.startX = 75;
    self.textAlignment = NSTextAlignmentLeft;
    [self show: self.fullName    textColor: self.color1  Fontsize: 42    location: 352   lineHeight: 43  lineWidth: self.width  fontType: font1];
    [self show: self.ocupation   textColor: self.color2  Fontsize: 42    location: 412   lineHeight: 43  lineWidth: self.width  fontType: font1];
    [self show: self.phoneNumber textColor: self.color2  Fontsize: 42    location: 523   lineHeight: 43  lineWidth: self.width  fontType: font1];
    [self show: self.email       textColor: self.color2  Fontsize: 42    location: 579   lineHeight: 43  lineWidth: self.width  fontType: font1];
    [self show: self.adress      textColor: self.color2  Fontsize: 42    location: 635   lineHeight: 43  lineWidth: self.width  fontType: font1];
    [self show: self.website     textColor: self.color1  Fontsize: 42    location: 691   lineHeight: 43  lineWidth: self.width  fontType: font1];
    
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) makeImage8_1b
{
    self.background.image = [UIImage imageNamed: @"8-1b"];
    [self.imageView addSubview: self.background];
    return [MakeImagesManager imageWithView: self.imageView];
}

-(UIImage *) checkFontSize
{
    self.background.image = [UIImage imageNamed: @"0-4"];
    [self.imageView addSubview: self.background];
    self.color1 = [UIColor blackColor];
    
    NSString *font1 = @"MetaPro-Normal";
    
    self.startX = 50;
    
    self.nameAndSurname.text = @"Ибрахим 37";
    self.patronymicName.text = @"Ибрахим 42";
    self.fullName.text       = @"Ибрахим 48";
    self.companyName.text    = @"Ибрахим 57";
    self.website.text        = @"Ибрахим 34";
    self.ocupation.text      = @"Ибрахим 40";
    self.phoneNumber.text    = @"Ибрахим 50";
    self.email.text          =  @"Ибрахим 64";
    
    self.textAlignment = NSTextAlignmentLeft;
    [self show: self.nameAndSurname    textColor: self.color1  Fontsize: 37    location: 37   lineHeight: 86  lineWidth: self.width  fontType: font1];
    [self show: self.patronymicName   textColor: self.color1  Fontsize: 42    location: 253   lineHeight: 86  lineWidth: self.width  fontType: font1];
    [self show: self.fullName         textColor: self.color1  Fontsize: 48    location: 516   lineHeight: 86  lineWidth: self.width  fontType: font1];
    [self show: self.companyName       textColor: self.color1  Fontsize: 57    location: 686   lineHeight: 86  lineWidth: self.width  fontType: font1];
    
    self.textAlignment = NSTextAlignmentRight;
    
    [self show: self.website    textColor: self.color1  Fontsize: 34    location: 37   lineHeight: 86  lineWidth: self.width  - 2 * self.startX fontType: font1];
    [self show: self.ocupation   textColor: self.color1  Fontsize: 40    location: 253   lineHeight: 86  lineWidth: self.width - 2 * self.startX  fontType: font1];
    [self show: self.phoneNumber textColor: self.color1  Fontsize: 50    location: 516   lineHeight: 86  lineWidth: self.width - 2 * self.startX fontType: font1];
    [self show: self.email       textColor: self.color1  Fontsize: 64    location: 686   lineHeight: 86  lineWidth: self.width - 2 * self.startX fontType: font1];
    
    return [MakeImagesManager imageWithView: self.imageView];
}






//Superclarendon-Light
//AppleGaramond-Bold

-(void) show:(UILabel *) label  textColor: (UIColor *) color Fontsize:(CGFloat) fontsize location: (CGFloat) Y lineHeight: (CGFloat) lineHeight lineWidth: (CGFloat) lineWidth  fontType:(NSString *) type
{
    label.frame = CGRectMake(self.startX, Y, lineWidth, lineHeight);
    label.textColor = color;
    
    //     label.backgroundColor = [UIColor colorWithRed:19/255.0 green:178/255.0 blue:124/255.0 alpha:1.0];
    
    label.textAlignment = self.textAlignment;
    label.font = [UIFont fontWithName: type size: fontsize];
   
//    if(type == 1)
//        label.font = [UIFont fontWithName: @"Futura-CondensedExtraBold" size: fontsize];
//    else if(type == 2)
//        label.font = [UIFont fontWithName: @"Futura-MediumItalic" size: fontsize];
//    else if (type == 3)
//        label.font = [UIFont fontWithName: @"Futura" size: fontsize];
//    else if(type == 4)
//        label.font = [UIFont fontWithName: @"Georgia" size: fontsize];

    
    [self.imageView addSubview: label];
}

-(CGFloat) RC:(CGFloat) x
{
    return x / 255.0;
}


- (void)fillLabels
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.width = 1440;
    self.height = 800;
    
    self.imageView.backgroundColor = [UIColor blueColor];
    self.background = [UIImageView new];
    self.background.frame = CGRectMake(0, 0, self.width, self.height);
    [self.imageView addSubview: self.background];
    
    
    self.fullName = [UILabel new];
    self.nameAndSurname = [UILabel new];
    self.patronymicName = [UILabel new];
    self.email = [UILabel new];
    self.ocupation = [UILabel new];
    self.adress = [UILabel new];
    self.phoneNumber = [UILabel new];
    self.companyName = [UILabel new];
    self.website = [UILabel new];
    self.emailAndWebsite = [UILabel new];
    
    self.fullName.text = [NSString stringWithFormat: @"%@ %@ %@", sharedManager.surname, sharedManager.name, sharedManager.patronymicName];
    self.nameAndSurname.text = [NSString stringWithFormat: @"%@ %@", sharedManager.surname, sharedManager.name];
    self.patronymicName.text = sharedManager.patronymicName;
    self.website.text = sharedManager.website;
    self.ocupation.text = sharedManager.ocupation;
    self.adress.text = sharedManager.adress;
    self.phoneNumber.text = sharedManager.phoneNumber;
    self.email.text = sharedManager.email;
    self.companyName.text = sharedManager.companyName;
    self.emailAndWebsite.text = [NSString stringWithFormat:@"%@ | %@", sharedManager.email, sharedManager.website];

}

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

-(void) checkFonts
{
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }

}

@end
