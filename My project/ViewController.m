//
//  ViewController.m
//  My project
//
//  Created by user on 03.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"
#import "MySingleton.h"
#import <Foundation/Foundation.h>
#import "MakeImagesManager.h"

#define DATA_KEY @"datakey"
#define PROFILE_KEY @"profilekey"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UILabel *textLabel2;

@property (nonatomic) UITextField *textField1;
@property (nonatomic) UITextField *textField2;
@property (nonatomic) UITextField *textField3;
@property (nonatomic) UIImageView *profileImageView;
@property (nonatomic) integer_t numberOfScreens;

@property (nonatomic) MakeImagesManager *manager;
@property (nonatomic) UIImageView *check;

@property (nonatomic) NSArray *arrayOfImages1;
@property (nonatomic) NSArray *arrayOfImages2;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self resetData];
    NSDictionary *barButtonAppearanceDict = @{NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-DemiBold" size:17.0]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonAppearanceDict forState:UIControlStateNormal];
    UIColor *colorOfTint = [UIColor colorWithRed: 33 / 255.0 green: 206 / 255.0 blue: 153 / 255.0 alpha: 1.0];
    self.navigationController.navigationBar.tintColor = colorOfTint;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initial];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    NSArray *dicts = [[NSUserDefaults standardUserDefaults] arrayForKey:DATA_KEY];

    if(!(dicts == NULL)) {
        [self fillSingleton];
        [self makeImages];
        
        [self goToAnotherScreen];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initial
{
    UIColor *colorofPalceHolder = [UIColor colorWithRed:163 / 255.0 green:167/255.0 blue:168/255.0 alpha:1.0];
    UIColor *colorOfText = [UIColor colorWithRed: 91/ 255.0 green:95 / 255.0 blue:98/255.0 alpha: 1.0];
    UIColor *textFieldBackgroundColor = [UIColor whiteColor];
    
    self.textLabel.text = @"Давайте начнем";
    self.textLabel2.text = @"Введите ваше полное имя";
    
    self.textField1 = [UITextField new];
    self.textField1.frame = CGRectMake(1, 125, 318, 25);

    self.textField1.backgroundColor = textFieldBackgroundColor;
    self.textField1.textAlignment = NSTextAlignmentCenter;
    self.textField1.textColor = colorOfText;
    self.textField1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Фамилия" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
    [self.view addSubview: self.textField1];
    
    self.textField2 = [UITextField new];
    self.textField2.frame = CGRectMake(1, 160, 318, 25);
    
    self.textField2.backgroundColor = textFieldBackgroundColor;
    self.textField2.textAlignment = NSTextAlignmentCenter;
    self.textField2.textColor = colorOfText;
    self.textField2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Имя" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
    [self.view addSubview: self.textField2];
    
    self.textField3 = [UITextField new];
    self.textField3.frame = CGRectMake(1, 195, 318, 25);
    
    self.textField3.backgroundColor = textFieldBackgroundColor;
    self.textField3.textAlignment = NSTextAlignmentCenter;
    self.textField3.textColor = colorOfText;
    self.textField3.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Отчество" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
    [self.view addSubview: self.textField3];
    
    
    self.numberOfScreens = 0;
    
}

- (IBAction)ContinueButtonPressed:(id)sender {
    MySingleton *sharedManager = [MySingleton sharedManager];
    UIColor *color = [UIColor colorWithRed:84 / 255.0 green:90/255.0 blue:95/255.0 alpha:1.0];
    UIColor *colorofPalceHolder = [UIColor colorWithRed:163 / 255.0 green:167/255.0 blue:168/255.0 alpha:1.0];
    
    
    if(self.numberOfScreens == 0) {
        
        sharedManager.surname = self.textField1.text;
        sharedManager.name = self.textField2.text;
        sharedManager.patronymicName = self.textField3.text;
        
        self.textLabel.text = @"Следующий шаг   2/4";
        self.textLabel2.text = @"Заполните нижеследующие поля";
        self.textField1.text = self.textField2.text = self.textField3.text = @"";
        
        self.textField1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Номер телефона" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
        self.textField2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Электронная почта" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
        self.textField3.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Должность" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
        
        self.numberOfScreens++;
    }
    else if(self.numberOfScreens == 1) {
        sharedManager.phoneNumber = self.textField1.text;
        sharedManager.email = self.textField2.text;
        sharedManager.ocupation = self.textField3.text;
        
        self.textLabel.text = @"Следующий шаг   3/4";
        self.textLabel2.text = @"Заполните нижеследующие поля";
        self.textField1.text = self.textField2.text = self.textField3.text = @"";

        self.textField1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Название компании" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
        self.textField2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Вебсайт" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
        
        self.textField3.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Адрес компании" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
        
        self.numberOfScreens++;
        
    }

    else if(self.numberOfScreens == 2) {
        sharedManager.companyName = self.textField1.text;
        sharedManager.website = self.textField2.text;
        sharedManager.adress = self.textField3.text;
        [self.textField1 setHidden: YES];
        [self.textField2 setHidden: YES];
        [self.textField3 setHidden: YES];
        UIImageView *path =[UIImageView new];
        path.frame = CGRectMake(0, 120, 320, 105);
        path.image = [UIImage imageNamed: @"Background"];
        [self.view addSubview: path];
        
        self.textLabel.text = @"Следующий шаг   4/4";
        self.textLabel2.text = @"Загрузите ваше фото или логотип";
        
        self.profileImageView = [UIImageView new];
        self.profileImageView.image = [UIImage imageNamed: @"photoPlace"];
        self.profileImageView.frame = CGRectMake(90, 115, 140, 140);
        

        self.profileImageView.layer.borderWidth = 0.5;
        self.profileImageView.layer.cornerRadius = 70;
        self.profileImageView.clipsToBounds = true;
        
        self.profileImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handelImageViewTap:)];
        [self.profileImageView addGestureRecognizer: singleTapRecognizer];
        
        [self.view addSubview: self.profileImageView];

        self.numberOfScreens++;
    }
    else if(self.numberOfScreens == 3){
        sharedManager.profile = self.profileImageView.image;
        [MySingleton saveSingleton];
        
        [self makeImages];
        [self goToAnotherScreen];
        
    }
    else {
        NSLog(@"%@", sharedManager.name);
        NSLog(@"%@", sharedManager.surname);
        NSLog(@"%@", sharedManager.patronymicName);
        NSLog(@"%@", sharedManager.email);
        NSLog(@"%@", sharedManager.phoneNumber);
        NSLog(@"%@", sharedManager.companyName);
        NSLog(@"%@", sharedManager.ocupation);
        NSLog(@"%@", sharedManager.adress);
    }
}

-(void) handelImageViewTap: (UITapGestureRecognizer *) tapGestureRecognizer
{
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController: picker animated: YES completion: nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if (!image) image = info[UIImagePickerControllerEditedImage];
    self.profileImageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {     [self dismissViewControllerAnimated: YES completion:nil];
}

-(void) resetData {
    NSMutableArray *dicts = NULL;
    
    [dicts removeAllObjects];
    
    [[NSUserDefaults standardUserDefaults] setObject:dicts forKey:DATA_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
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

    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:PROFILE_KEY];
    sharedManager.profile = [UIImage imageWithData:imageData];
}

- (void) makeImages
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    self.manager = [MakeImagesManager new];
    [self.manager fillLabels];
    
    self.check = [UIImageView new];
    self.check.frame = CGRectMake(10, 343, 300, 166);
    [self.view addSubview: self.check];
    
//    UIImage *image1  = [self.manager makeImage0_1];
//    UIImage *image1b = [self.manager makeImage0_1b];
//    UIImage *image2  = [self.manager makeImage0_2];
//    UIImage *image2b = [self.manager makeImage0_2b];
//    UIImage *image3  = [self.manager makeImage0_3];
//    UIImage *image3b = [self.manager makeImage0_3b];
//    UIImage *image4  = [self.manager makeImage0_4];
//    UIImage *image4b = [self.manager makeImage0_4b];
//    UIImage *image5;
//    UIImage *image5b;
//    UIImage *image6;
//
//    
//    sharedManager.categoryImages1 = [[NSMutableArray alloc] initWithCapacity: 14];
//    sharedManager.categoryImages2 = [[NSMutableArray alloc] initWithCapacity: 14];
//    self.arrayOfImages1 = [[NSArray alloc] initWithObjects: image1,  image2,  image3,  image4,  nil];
//    self.arrayOfImages2 = [[NSArray alloc] initWithObjects: image1b, image2b, image3b, image4b, nil];
//    
//    [sharedManager.categoryImages1 addObject: self.arrayOfImages1];
//    [sharedManager.categoryImages2 addObject: self.arrayOfImages2];
//    
//    image1 = [self.manager makeImage1_1];
//    image1b = [self.manager makeImage1_1b];
//    image2 = [self.manager makeImage1_2];
//    image2b = [self.manager makeImage1_2b];
//    
//    image3 = [self.manager makeImage2_1];
//    image3b = [self.manager makeImage2_1b];
//    image4 = [self.manager makeImage2_2];
//    image4b = [self.manager makeImage2_2b];
//    image5 = [self.manager makeImage8_1];
//    image5b = [self.manager makeImage8_1b];
//    image6 = [self.manager checkFontSize];
//    
//    self.check.image = image6;
//
//    self.arrayOfImages1 = [[NSArray alloc] initWithObjects: image1,  image2,  image3,  image4,  image5,  image6, nil];
//    self.arrayOfImages2 = [[NSArray alloc] initWithObjects: image1b, image2b, image3b, image4b, image5b, image6, nil];
//    [sharedManager.categoryImages1 addObject: self.arrayOfImages1];
//    [sharedManager.categoryImages2 addObject: self.arrayOfImages2];

    UIImage *image1  = [self.manager makeImage0_1];
    UIImage *image1b = [self.manager makeImage0_1b];
    UIImage *image2  = [self.manager makeImage1_2];
    UIImage *image2b = [self.manager makeImage1_2b];
    UIImage *image3  = [self.manager makeImage2_1];
    UIImage *image3b = [self.manager makeImage2_1b];
    UIImage *image4  = [self.manager makeImage2_2];
    UIImage *image4b = [self.manager makeImage2_2b];
    UIImage *image5  = [self.manager makeImage8_1];
    UIImage *image5b = [self.manager makeImage8_1b];
    sharedManager.categoryImages1 = [[NSMutableArray alloc] initWithCapacity: 14];
    sharedManager.categoryImages2 = [[NSMutableArray alloc] initWithCapacity: 14];
    self.arrayOfImages1 = [[NSArray alloc] initWithObjects: image1,  image2,  image3,  image4,  image5,  nil];
    self.arrayOfImages2 = [[NSArray alloc] initWithObjects: image1b, image2b, image3b, image4b, image5b, nil];
    [sharedManager.categoryImages1 addObject: self.arrayOfImages1];
    [sharedManager.categoryImages2 addObject: self.arrayOfImages2];
    
}

-(void) goToAnotherScreen
{
//    [self performSegueWithIdentifier:@"goToMenu" sender:self];
    [self performSegueWithIdentifier: @"goToCards" sender: self];
}


@end
