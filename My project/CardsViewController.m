//
//  CardsViewController.m
//  My project
//
//  Created by user on 27.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "CardsViewController.h"
#import "MySingleton.h"
#define mainGreenColor [UIColor colorWithRed: 33 / 255.0 green: 206 / 255.0 blue: 153 / 255.0 alpha: 1.0]

@interface CardsViewController () <UIScrollViewDelegate>

@property (nonatomic) UILabel *price;
@property (nonatomic) UILabel *numberOfPage;
@property (nonatomic) UIScrollView *firstScrollView;
@property (nonatomic) UIImageView *backsideImageView;

@property (strong, nonatomic) NSMutableArray *pageImages;
@property (strong, nonatomic) NSMutableArray *pageImagesBackSide;
@property (strong, nonatomic) NSMutableArray *pageViews;
@property (strong, nonatomic) IBOutlet UISwitch *switcher;

@property (nonatomic) NSInteger pageCount;

-(void) loadVisiblePages;
-(void) loadPage: (NSInteger)page;

@end

@implementation CardsViewController

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    CGSize pagesScrollViewSize = self.firstScrollView.frame.size;
    self.firstScrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);

    [self.navigationController.navigationBar setHidden: YES];
    
    MySingleton *sharedManager = [MySingleton sharedManager];
    self.pageImages = sharedManager.categoryImages1[self.choosenType];
    self.pageImagesBackSide = sharedManager.categoryImages2[self.choosenType];
    [self loadVisiblePages];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.price = [UILabel new];
    self.price.text = @"+1000 \u20B8";
    self.price.textColor = [UIColor colorWithRed: 33 / 255.0 green: 206 / 255.0 blue: 153 / 255.0 alpha: 1.0];
    self.price.frame = CGRectMake(188, 297, 80, 22);
    self.price.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size: 17.0];
    [self.view addSubview: self.price];
    
    self.firstScrollView = [UIScrollView new];
    self.backsideImageView = [UIImageView new];
    self.firstScrollView.frame = CGRectMake(10, 113, 300, 168);
    self.backsideImageView.frame = CGRectMake(10, 337, 300, 168);
    self.firstScrollView.scrollEnabled = YES;
    self.firstScrollView.pagingEnabled = YES;
    [self.view addSubview: self.firstScrollView];
    [self.view addSubview: self.backsideImageView];
    
    self.numberOfPage = [UILabel new];
    self.numberOfPage.textColor = mainGreenColor;
    self.numberOfPage.frame = CGRectMake(273, 73, 50, 23);
    [self.view addSubview: self.numberOfPage];
    
    
    self.firstScrollView.delegate = self;

    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.choosenType = 0;
    
    self.pageImages = sharedManager.categoryImages1[self.choosenType];
    self.pageImagesBackSide = sharedManager.categoryImages2[self.choosenType];
    
    self.pageCount = self.pageImages.count;
    
    self.numberOfPage.text = [NSString stringWithFormat:@"1/%d", self.pageCount];

    self.backsideImageView.image = self.pageImagesBackSide[0];
    
    self.pageViews = [[NSMutableArray alloc] init];
    for(NSInteger i = 0; i < self.pageCount; i++) {
        [self.pageViews addObject:[NSNull null]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) loadPage:(NSInteger)page {
    if(page < 0 || page >= self.pageImages.count)
        return;
    
    UIView *pageView = [self.pageViews objectAtIndex:page];
    
//    if((NSNull *)pageView == [NSNull null]) {
    if(1) {
        CGRect frame = self.firstScrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.firstScrollView addSubview: newPageView];
        
        [self.pageViews replaceObjectAtIndex:page withObject: newPageView];
    }
}


-(void)loadVisiblePages {
    CGFloat pageWidth = self.firstScrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.firstScrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    for(NSInteger i = 0; i < self.pageImages.count; i++)
        [self loadPage: i];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.firstScrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.firstScrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    self.backsideImageView.image = self.pageImagesBackSide[page];
    self.numberOfPage.text = [NSString stringWithFormat:@"%d/%d", page + 1, self.pageCount];
    
    NSLog(@"%d", page);
}

- (IBAction)continueButtonPressed:(id)sender {
    CGFloat pageWidth = self.firstScrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.firstScrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    sharedManager.backSide = self.switcher.on;
    sharedManager.orderedImage1 = self.pageImages[page];
    sharedManager.orderedImage2 = self.pageImagesBackSide[page];
    NSLog(@"%d", page);
}
- (IBAction)switcherDidPushed:(id)sender {
    if(self.switcher.on)
        [self.backsideImageView setHidden: NO];
    else
        [self.backsideImageView setHidden: YES];
    
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
