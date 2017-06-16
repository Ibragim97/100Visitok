//
//  OrderViewController.m
//  My project
//
//  Created by user on 27.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "OrderViewController.h"
#import "MySingleton.h"
#import <Parse/Parse.h>

#define mainGreenColor [UIColor colorWithRed: 33 / 255.0 green: 206 / 255.0 blue: 153 / 255.0 alpha: 1.0]

@interface OrderViewController ()

@property UILabel *priceLabel;
@property UILabel *tengeLabel;
@property int price;
@property (strong, nonatomic) IBOutlet UIButton *orderButton;


@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.priceLabel = [UILabel new];
    self.tengeLabel = [UILabel new];
    self.priceLabel.textColor = mainGreenColor;
    self.tengeLabel.textColor = mainGreenColor;
    self.priceLabel.frame = CGRectMake(76, 178, 180, 98);
    self.tengeLabel.frame = CGRectMake(150, 268, 78, 41);
    self.priceLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size: 72.0];
    self.tengeLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size: 60.0];
    self.price = 5000 + (sharedManager.backSide == YES ? 1000 : 0);
    self.priceLabel.text = [NSString stringWithFormat: @"%d", self.price];
    self.tengeLabel.text = @"\u20B8";
    [self.view addSubview: self.priceLabel];
    [self.view addSubview: self.tengeLabel];
}

- (IBAction)orderButtonPressed:(id)sender {
    self.orderButton.enabled = NO;
    
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    UIImage *imageFrontSide = sharedManager.orderedImage1;
    UIImage *imageBackSide  = sharedManager.orderedImage2;
    
    NSData *imageData1 = UIImagePNGRepresentation(imageFrontSide);
    NSData *imageData2 = UIImagePNGRepresentation(imageBackSide);
    
    PFFile *imageFile1 = [PFFile fileWithName:@"front_side.png" data:imageData1];
    PFFile *imageFile2 = [PFFile fileWithName:@"back_side.png" data: imageData2];
    //    NSData *imageData = [self convertPdfToImage: image];
    //    PFFile *imageFile = [PFFile fileWithName:@"image.pdf" data:imageData];
   
    PFObject *userPhoto = [PFObject objectWithClassName:@"Cards"];
    userPhoto[@"FrontSide"] = imageFile1;
    if(sharedManager.backSide == YES)
        userPhoto[@"BackSide"]  = imageFile2;
    userPhoto[@"Name"]  = [NSString stringWithFormat: @"%@ %@ %@", sharedManager.surname, sharedManager.name, sharedManager.patronymicName];
    userPhoto[@"Email"] = sharedManager.email;
    userPhoto[@"PhoneNumber"] = sharedManager.phoneNumber;
    userPhoto[@"Adress"] = sharedManager.adress;
    userPhoto[@"CompanyName"] = sharedManager.companyName;
    userPhoto[@"Ocupation"] = sharedManager.ocupation;
   
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Спасибо за заказ!"
                                                   message: @"Через некоторое время мы вам позвоним для уточнения заказа "
                                                  delegate: self
                                         cancelButtonTitle: nil
                                         otherButtonTitles:@"OK",nil];
    
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle: @"Операцая не выполнена."
                                                    message: @"Невозможно соединиться с сервером. Проверьте подкючение к интернету"
                                                   delegate: self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:@"Меню",nil];
   
    [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(error) {
            NSLog(@"Hmm....");
            [alert2 setTag: 1];
            [alert2 show];
        }
        if(succeeded) {
            NSLog(@"Yeap!");
            [alert setTag: 2];
            [alert show];
        }
    }];
 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.orderButton.enabled = YES;
    
    if(alertView.tag == 2) {
        [self goToAnotherScreen];
    
    }   else {
        
        
        if (buttonIndex == 1)
        {
            NSLog(@"user pressed Button Indexed 0");
            [self goToAnotherScreen];
            // Any action can be performed here
        }
        else
        {
            NSLog(@"user pressed Button Indexed 1");
            // Any action can be performed here
        }
    }
}

-(void) goToAnotherScreen
{
//    [self performSegueWithIdentifier:@"goToMenu" sender:self];
    [self performSegueWithIdentifier:@"goToCards" sender:self];
    
}

@end
