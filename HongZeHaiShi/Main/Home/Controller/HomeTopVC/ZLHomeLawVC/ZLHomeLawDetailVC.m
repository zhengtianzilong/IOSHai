//
//  ZLHomeLawDetailVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeLawDetailVC.h"
#import "ZLLawAttachView.h"
#import "ZLQuickLookVC.h"

@interface ZLHomeLawDetailVC ()<UIWebViewDelegate,QLPreviewControllerDataSource,QLPreviewControllerDelegate>{
    UIWebView *openFileWebView;
    
}
@property (nonatomic, strong) ZLLawAttachView *attachView;
@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, retain)NSString *fileURLString;
@property (nonatomic,strong)NSURL *fileURL;
@end

@implementation ZLHomeLawDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - TopBarHeight)];
    [self.view addSubview:_webView];
    
    _attachView = [[ZLLawAttachView alloc]init];
    [self.view addSubview:_attachView];
    [_attachView.attacthBtn setTitle:self.attachName forState:(UIControlStateNormal)] ;
    
    [_attachView.attacthBtn addTarget:self action:@selector(openFile:) forControlEvents:(UIControlEventTouchUpInside)];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", Law_Base_URL, self.url];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    
   self.fileURLString = [NSString stringWithFormat:@"%@%@", Attach_Base_URL, self.attachurl];
    self.fileURLString = [self.fileURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    
    [self downloadFile];
    
}

-(void)openFile:(UIButton *)sender{
    openFileWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    openFileWebView.delegate = self;
    [openFileWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.fileURLString]]];
}






- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

    
    [_attachView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(Main_Screen_Width);
        make.height.mas_equalTo(30);
    }];
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.attachView.mas_top);
        make.width.mas_equalTo(Main_Screen_Width);
        
    }];
    
    
}



- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    
    return YES;
}
#pragma mark - Web代理
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSURL *targetURL = [NSURL URLWithString:self.fileURLString];
    
    NSString *docPath = [self documentsDirectoryPath];
    NSString *pathToDownloadTo = [NSString stringWithFormat:@"%@/%@", docPath, [targetURL lastPathComponent]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL hasDownLoad= [fileManager fileExistsAtPath:pathToDownloadTo];
    if (hasDownLoad) {
        self.fileURL = [NSURL fileURLWithPath:pathToDownloadTo];
        QLPreviewController *qlVC = [[QLPreviewController alloc]init];
        qlVC.delegate = self;
        qlVC.dataSource = self;
        [self.navigationController pushViewController:qlVC animated:YES];
        //
    }
    else {
        NSURL *targetURL = [NSURL URLWithString:self.fileURLString];
        
        NSData *fileData = [[NSData alloc] initWithContentsOfURL:targetURL];
        // Get the path to the App's Documents directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
        [fileData writeToFile:[NSString stringWithFormat:@"%@/%@", documentsDirectory, [targetURL lastPathComponent]] atomically:YES];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [openFileWebView loadRequest:request];
    }
    
    NSLog(@"webViewDidFinishLoad");
}

- (void)downloadFile{
    
    NSString *urlStr = @"http://222.184.122.89:18880/hzhs/hzhs/act/upload/UploadFileAct/upload4Url.act?attachmentId=1712_fa0d12db1ff15d8671d4cbf51c81d0f8,&attachmentName=%E6%B4%AA%E6%B3%BD%E6%B9%96%E9%80%9A%E8%88%AA%E7%A7%A9%E5%BA%8F%E7%AE%A1%E7%90%86%E7%9A%84%E8%88%AA%E8%A1%8C%E9%80%9A%E5%91%8A.doc*&module=law";

    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            
            NSError *saveError;
            
            NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            
            NSString *savePath = [cachePath stringByAppendingPathComponent:@"ceshi.doc"];
            
            NSURL *saveUrl = [NSURL fileURLWithPath:savePath];
            
            //把下载的内容从cache复制到document下
            
            [[NSFileManager defaultManager] copyItemAtURL:location toURL:saveUrl error:&saveError];
            
            if (!saveError) {
                
                NSLog(@"save success");
                
            }else{
                
                NSLog(@"save error:%@",saveError.localizedDescription);
                
            }
            
        }else{
            
            NSLog(@"download error:%@",error.localizedDescription);
            
        }
        
    }];
    
    [downloadTask resume];
    
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError");
    
    
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return self.fileURL;
}

- (void)previewControllerWillDismiss:(QLPreviewController *)controller {
    NSLog(@"previewControllerWillDismiss");
}

- (void)previewControllerDidDismiss:(QLPreviewController *)controller {
    NSLog(@"previewControllerDidDismiss");
}

- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item{
    return YES;
}

- (CGRect)previewController:(QLPreviewController *)controller frameForPreviewItem:(id <QLPreviewItem>)item inSourceView:(UIView * __nullable * __nonnull)view{
    return CGRectZero;
}

- (NSString *)documentsDirectoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    return documentsDirectoryPath;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"法律法规详情" attributes:dic];
    
    return title;
    
}

@end
