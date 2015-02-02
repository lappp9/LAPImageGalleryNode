
#import "LAPViewController.h"

@interface LAPViewController ()

@property (nonatomic) LAPImageGalleryNode *imageGallery;

@end

@implementation LAPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGFloat galleryWidth = self.view.bounds.size.width;
    
    LAPImageGalleryNode *imageGallery = [[LAPImageGalleryNode alloc] init];
    imageGallery.frame = CGRectMake(8, 8, galleryWidth - 16, 250);
    imageGallery.cornerRadius = 4;
    imageGallery.dataSource = self;
    imageGallery.delegate = self;
    
    [self.view addSubview:imageGallery.view];
}

- (BOOL)shouldAutorotate;
{
    return NO;
}

#pragma mark Image Gallery Datasource

- (NSURL *)imageGallery:(LAPImageGalleryNode *)imageGallery urlForImageAtIndex:(NSInteger)index;
{
    CGFloat rand1 = arc4random_uniform(200) + 200;
    CGFloat rand2 = arc4random_uniform(200) + 200;
    NSURL *kittenURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://placekitten.com/%i/%i", (int)rand1, (int)rand2]];
    
    return kittenURL;
}

- (NSInteger)numberOfImagesInImageGallery:(LAPImageGalleryNode *)imageGallery;
{
    return 10;
}

- (CGFloat)widthForImages;
{
    return self.view.bounds.size.width - 16 - 50;
}

#pragma mark Image Gallery Delegate

- (BOOL)imageGalleryShouldDisplayPositions;
{
    return YES;
}

- (BOOL)prefersStatusBarHidden;
{
    return YES;
}

@end
