//
//  EditViewController.m
//  My project
//
//  Created by user on 24.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "EditViewController.h"
#import "MySingleton.h"
#import "Parse/Parse.h"
#import "MakeImagesManager.h"

@interface EditViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic)  UITextField *surname;
@property (nonatomic)  UITextField *name;
@property (nonatomic)  UITextField *patronymicName;
@property (nonatomic)  UITextField *email;
@property (nonatomic)  UITextField *phoneNumber;
@property (nonatomic)  UITextField *companyName;
@property (nonatomic)  UITextField *ocupation;
@property (nonatomic)  UITextField *adress;
@property (nonatomic)  UITextField *website;
@property (nonatomic)  UIImageView *profileImageView;

@property (nonatomic) MakeImagesManager *manager;
@property (nonatomic) NSArray *arrayOfImages1;
@property (nonatomic) NSArray *arrayOfImages2;

@property int widthOfTextField;
@property int startXofTextField;

@end

@implementation EditViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.widthOfTextField = 220;
    self.startXofTextField = 50;
    NSLog(@"HEY");
    
//   [self fillTextFields];
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    UIColor *colorofPalceHolder = [UIColor colorWithRed: 91/ 255.0 green:95 / 255.0 blue:98/255.0 alpha: 1.0];
    UIColor *colorOfText = [UIColor whiteColor];
    UIColor *textFieldBackgroundColor = [UIColor colorWithRed:33 /255.0 green:206/255.0 blue: 153 /255.0 alpha: 1.0];
    self.ocupation.frame = CGRectMake(128, 108, 190, 25);
    self.ocupation.backgroundColor = textFieldBackgroundColor;
    self.ocupation.textAlignment = NSTextAlignmentCenter;
    self.ocupation.textColor = colorOfText;
    self.ocupation.attributedPlaceholder = [[NSAttributedString new] initWithString:@"Должность" attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
    self.ocupation.text = sharedManager.ocupation;
    [self.view addSubview: self.ocupation];
    
    [self showTextField: self.surname withText: sharedManager.surname andPlaceHolder: @"Фамилия" onPosition: 212];
    [self showTextField: self.name withText: sharedManager.name andPlaceHolder: @"Имя" onPosition: 256];
    [self showTextField: self.patronymicName withText: sharedManager.patronymicName andPlaceHolder: @"Отчество" onPosition: 300];
    [self showTextField: self.phoneNumber withText: sharedManager.phoneNumber andPlaceHolder: @"Номер телефона" onPosition: 344];
    [self showTextField: self.email withText: sharedManager.email andPlaceHolder: @"Электронная почта" onPosition: 388];
    [self showTextField: self.companyName withText: sharedManager.companyName andPlaceHolder: @"Название компании" onPosition: 432];
    [self showTextField: self.website withText: sharedManager.website andPlaceHolder: @"Вебсайт" onPosition: 476];
    [self showTextField: self.adress withText: sharedManager.adress andPlaceHolder: @"Адресс компании" onPosition: 520];
}

-(void) setProfileImage
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    self.profileImageView = [UIImageView new];
    self.profileImageView.frame = CGRectMake(12, 76, 100, 100);
    self.profileImageView.layer.borderWidth = 0.5;
    self.profileImageView.layer.cornerRadius = 50;
    self.profileImageView.clipsToBounds = true;
    self.profileImageView.userInteractionEnabled = YES;
    [self.view addSubview: self.profileImageView];
    self.profileImageView.image = sharedManager.profile;

    self.profileImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handelImageViewTap:)];
    [self.profileImageView addGestureRecognizer: singleTapRecognizer];

}

-(void) fillTextFields
{
    self.surname = [UITextField new];
    self.name = [UITextField new];
    self.patronymicName = [UITextField new];
    self.phoneNumber = [UITextField new];
    self.email = [UITextField new];
    self.companyName = [UITextField new];
    self.ocupation = [UITextField new];
    self.adress = [UITextField new];
    self.website = [UITextField new];
}


- (void) textFieldEditingBegin: (id) sender
{
    UITextField *text = (UITextField *)sender;
    
    if([text.placeholder  isEqual: @"Номер телефона"]) {
        [self hideTextFields];
        self.patronymicName.frame = CGRectMake(self.startXofTextField, 212, self.widthOfTextField, 25);
        self.phoneNumber.frame    = CGRectMake(self.startXofTextField, 256, self.widthOfTextField, 25);
        self.email.frame          = CGRectMake(self.startXofTextField, 300, self.widthOfTextField, 25);
    }
    else if([text.placeholder  isEqual: @"Электронная почта"]) {
        [self hideTextFields];
        self.phoneNumber.frame = CGRectMake(self.startXofTextField, 212, self.widthOfTextField, 25);
        self.email.frame    = CGRectMake(self.startXofTextField, 256, self.widthOfTextField, 25);
        self.companyName.frame          = CGRectMake(self.startXofTextField, 300, self.widthOfTextField, 25);
    }
    else if([text.placeholder  isEqual: @"Название компании"]) {
        [self hideTextFields];
        self.email.frame = CGRectMake(self.startXofTextField, 212, self.widthOfTextField, 25);
        self.companyName.frame    = CGRectMake(self.startXofTextField, 256, self.widthOfTextField, 25);
        self.website.frame          = CGRectMake(self.startXofTextField, 300, self.widthOfTextField, 25);
    }
    else  if([text.placeholder  isEqual: @"Вебсайт"]) {
        [self hideTextFields];
        self.companyName.frame = CGRectMake(self.startXofTextField, 212, self.widthOfTextField, 25);
        self.website.frame    = CGRectMake(self.startXofTextField, 256, self.widthOfTextField, 25);
        self.adress.frame          = CGRectMake(self.startXofTextField, 300, self.widthOfTextField, 25);
    }
    else if([text.placeholder  isEqual: @"Адресс компании"]) {
        [self hideTextFields];
        self.companyName.frame = CGRectMake(self.startXofTextField, 212, self.widthOfTextField, 25);
        self.website.frame    = CGRectMake(self.startXofTextField, 256, self.widthOfTextField, 25);
        self.adress.frame          = CGRectMake(self.startXofTextField, 300, self.widthOfTextField, 25);
    }
}

-(void) hideTextFields
{
    self.surname.frame          = CGRectMake(self.startXofTextField, 600, self.widthOfTextField, 25);
    self.name.frame             = CGRectMake(self.startXofTextField, 600, self.widthOfTextField, 25);
    self.patronymicName.frame   = CGRectMake(self.startXofTextField, 600, self.widthOfTextField, 25);
    self.phoneNumber.frame      = CGRectMake(self.startXofTextField, 600, self.widthOfTextField, 25);
    self.email.frame            = CGRectMake(self.startXofTextField, 600, self.widthOfTextField, 25);
    self.companyName.frame      = CGRectMake(self.startXofTextField, 600, self.widthOfTextField, 25);
    self.adress.frame           = CGRectMake(self.startXofTextField, 600, self.widthOfTextField, 25);
    self.website.frame          = CGRectMake(self.startXofTextField, 600, self.widthOfTextField, 25);
}

- (void) textFieldEditingEnd : (id) sender
{
    self.surname.frame          = CGRectMake(self.startXofTextField, 212, self.widthOfTextField, 25);
    self.name.frame             = CGRectMake(self.startXofTextField, 256, self.widthOfTextField, 25);
    self.patronymicName.frame   = CGRectMake(self.startXofTextField, 300, self.widthOfTextField, 25);
    self.phoneNumber.frame      = CGRectMake(self.startXofTextField, 344, self.widthOfTextField, 25);
    self.email.frame            = CGRectMake(self.startXofTextField, 388, self.widthOfTextField, 25);
    self.companyName.frame      = CGRectMake(self.startXofTextField, 432, self.widthOfTextField, 25);
    self.website.frame          = CGRectMake(self.startXofTextField, 476, self.widthOfTextField, 25);
    self.adress.frame           = CGRectMake(self.startXofTextField, 520, self.widthOfTextField, 25);
}

-(void) showTextField: (UITextField *) textField withText: (NSString *) text andPlaceHolder: (NSString *) placeHolder onPosition: (CGFloat) Y
{
    
    UIColor *colorofPalceHolder = [UIColor colorWithRed:163 / 255.0 green:167/255.0 blue:168/255.0 alpha:1.0];
    UIColor *colorOfText = [UIColor colorWithRed: 91/ 255.0 green:95 / 255.0 blue:98/255.0 alpha: 1.0];
    UIColor *textFieldBackgroundColor = [UIColor whiteColor];
    
    textField.frame = CGRectMake(self.startXofTextField, Y, self.widthOfTextField, 25);
    textField.backgroundColor = textFieldBackgroundColor;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.textColor = colorOfText;
    textField.attributedPlaceholder = [[NSAttributedString new] initWithString:placeHolder attributes: @{NSForegroundColorAttributeName: colorofPalceHolder}];
    
    textField.text = text;
    
    [textField addTarget: self action:@selector(textFieldEditingBegin:) forControlEvents: UIControlEventEditingDidBegin];
    
    [textField addTarget: self action:@selector(textFieldEditingEnd:) forControlEvents: UIControlEventEditingDidEnd];

    [self.view addSubview: textField];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View Did Load");
    [self setProfileImage];
    [self fillTextFields];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)finishButtonPressed:(id)sender {
    [self saveChanges];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) saveChanges
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    sharedManager.surname =  self.surname.text;
    sharedManager.name = self.name.text;
    sharedManager.patronymicName = self.patronymicName.text;
    sharedManager.email = self.email.text;
    sharedManager.phoneNumber = self.phoneNumber.text;
    sharedManager.companyName = self.companyName.text;
    sharedManager.ocupation = self.ocupation.text;
    sharedManager.adress = self.adress.text;
    sharedManager.website = self.website.text;
    sharedManager.profile = self.profileImageView.image;
    
    [MySingleton saveSingleton];
    [self remakeImages];
}

-(void) remakeImages
{
    MySingleton *sharedManager = [MySingleton sharedManager];

    self.manager = [MakeImagesManager new];
    [self.manager fillLabels];
    
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
    self.arrayOfImages1 = [[NSArray alloc] initWithObjects: image1,  image2,  image3,  image4,  image5,  nil];
    self.arrayOfImages2 = [[NSArray alloc] initWithObjects: image1b, image2b, image3b, image4b, image5b, nil];

    [sharedManager.categoryImages1 replaceObjectAtIndex: 0 withObject: self.arrayOfImages1];
    [sharedManager.categoryImages2 replaceObjectAtIndex: 0 withObject: self.arrayOfImages2];
}

-(void) handelImageViewTap: (UITapGestureRecognizer *) tapGestureRecognizer
{
    [self saveChanges];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
