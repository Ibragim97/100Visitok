//
//  MainMenuViewController.m
//  My project
//
//  Created by user on 22.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MySingleton.h"
#import "CardsViewController.h"

@interface MainMenuViewController () <MainMenuViewController, UICollectionViewDataSource, UICollectionViewDelegate,CardsViewController>


@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) NSMutableArray *pageViews;

@property (strong, nonatomic) NSMutableArray * cattegoriesImages;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSInteger choosenType;

-(void) loadVisiblePages;
-(void) loadPage: (NSInteger)page;
-(void) purgePage: (NSInteger) page;

@end

@implementation MainMenuViewController

@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize pageImages = _pageImages;
@synthesize pageViews = _pageViews;

-(void) loadPage:(NSInteger)page {
    if(page < 0 || page >= self.pageImages.count)
        return;
    
    UIView *pageView = [self.pageViews objectAtIndex:page];
    
    if((NSNull *)pageView == [NSNull null]) {
        CGRect frame = self.scrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollView addSubview: newPageView];
        
        [self.pageViews replaceObjectAtIndex:page withObject: newPageView];
    }
}

-(void) purgePage:(NSInteger)page {
    if(page < 0 || page >= self.pageImages.count) {
        return;
    }
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if((NSNull *)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViews replaceObjectAtIndex:page  withObject:[NSNull null]];
    }
}

-(void)loadVisiblePages {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    self.pageControl.currentPage = page;
    for(NSInteger i = 0; i < self.pageImages.count; i++)
        [self loadPage: i];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    self.pageControl.currentPage = page;
    NSLog(@"%d", page);
}

-(void) viewWillAppear:(BOOL)animated {
   [super viewWillAppear:animated];
    
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    [self loadVisiblePages];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    self.scrollView.delegate = self;
    UITapGestureRecognizer *scrollViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action: @selector(selectorOfScrollView)];
    [self.scrollView addGestureRecognizer: scrollViewRecognizer];
    
    self.pageImages = [NSArray arrayWithObjects:
                       [UIImage imageNamed: @"image1"],
                       [UIImage imageNamed: @"image2"],
                       [UIImage imageNamed: @"image3"],
                       [UIImage imageNamed: @"image4"],
                       [UIImage imageNamed: @"image5"],
                       nil];
    NSInteger pageCount = self.pageImages.count;
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount;
    
    self.pageViews = [[NSMutableArray alloc] init];
    for(NSInteger i = 0; i < pageCount; i++) {
        [self.pageViews addObject:[NSNull null]];
    }
    
    self.cattegoriesImages = [NSMutableArray new];
    
    for(int i = 1; i <= 12; i++) {
        NSString *imageName = [NSString stringWithFormat: @"category_%d", i];
        [self.cattegoriesImages addObject: imageName];
    }
        
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView reloadData];
    
    /*
     UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageViewTap:)];
     
     [self.scrollView addGestureRecognizer:singleTapRecognizer];
     */
}

-(void) selectorOfScrollView
{
    self.choosenType = 12;
    [self performSegueWithIdentifier:@"goToCard" sender:self];
    
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d", indexPath.row);
    self.choosenType = indexPath.row;
    [self performSegueWithIdentifier:@"goToCard" sender:self];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.cattegoriesImages.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    
    collectionImageView.image = [UIImage imageNamed:[self.cattegoriesImages objectAtIndex:indexPath.row]];
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[CardsViewController class]])
    {
        CardsViewController *nextVC = segue.destinationViewController;
        nextVC.delegate = self;
        nextVC.choosenType = self.choosenType;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSData *) convertPdfToImage: (UIImage *) image
{
    double pageWidth = image.size.width;
    double pageHeight = image.size.height;
    
    NSMutableData *pdfFile = [[NSMutableData alloc] init];
    CGDataConsumerRef pdfConsumer =
    CGDataConsumerCreateWithCFData((CFMutableDataRef)pdfFile);
    // The page size matches the image, no white borders.
    CGRect mediaBox = CGRectMake(0, 0, pageWidth, pageHeight);
    CGContextRef pdfContext = CGPDFContextCreate(pdfConsumer, &mediaBox, NULL);
    
    CGContextBeginPage(pdfContext, &mediaBox);
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
            CGContextTranslateCTM(pdfContext, pageWidth, pageHeight);
            CGContextScaleCTM(pdfContext, -1, -1);
            break;
        case UIImageOrientationLeft:
            mediaBox.size.width = pageHeight;
            mediaBox.size.height = pageWidth;
            CGContextTranslateCTM(pdfContext, pageWidth, 0);
            CGContextRotateCTM(pdfContext, M_PI / 2);
            break;
        case UIImageOrientationRight:
            mediaBox.size.width = pageHeight;
            mediaBox.size.height = pageWidth;
            CGContextTranslateCTM(pdfContext, 0, pageHeight);
            CGContextRotateCTM(pdfContext, -M_PI / 2);
            break;
        case UIImageOrientationUp:
        default:
            break;
    }
    CGContextDrawImage(pdfContext, mediaBox, [image CGImage]);
    CGContextEndPage(pdfContext);
    
    CGContextRelease(pdfContext);
    CGDataConsumerRelease(pdfConsumer);
    
    //    NSData *pdfData = [PDFImageConverter convertImageToPDF: image
    //                                  withHorizontalResolution: 300 verticalResolution: 300];
    //    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/image.pdf"];
    //    [pdfData writeToFile:path atomically:NO];
    return [NSData dataWithData:pdfFile];
}

@end
