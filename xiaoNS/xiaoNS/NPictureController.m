//
//  NPictureController.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/5.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NPictureController.h"
#import "NNavAddPicController.h"

#import "UIImageView+WebCache.h"

#import "subPicture.h"

@interface NPictureController ()

@property(nonatomic, strong)NSArray *subPictures;

@end

@implementation NPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.imgs);
    
    [self setSubPictures];
    [self setAllImages];
    
}

- (void)addPicture {
    NNavAddPicController *navAddPic = [[NNavAddPicController alloc] init];
    [self presentViewController:navAddPic animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSubPictures {
    NSMutableArray *dictArray = [NSMutableArray array];
    NSDictionary *subPicturesArray = self.imgs;
    for (NSDictionary *dict in subPicturesArray) {
        subPicture *pic = [subPicture subPictureWithDict:dict];
        [dictArray addObject:pic];
    }
    self.subPictures = dictArray;
}

- (void)setAllImages {
    
    CGFloat viewW = self.view.frame.size.width;
    CGFloat viewH = self.view.frame.size.height;
    // 加载一个滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, viewW, viewH)];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    
    
    // 加载图片视图
    
    CGFloat imageW = (viewW - 4 * 10) / 3;
    CGFloat imageH = imageW;
    
    CGFloat scrollH = viewH;
    CGFloat allPicH = 0;
    for (int i=0; i<self.subPictures.count; i++) {
        int ii = i%3;
        int jj = i/3;
        CGFloat imageX = picMargin + (imageW + picMargin) * ii;
        CGFloat imageY = picMargin + (imageH + picMargin) * jj;
        UIImageView *img = [[UIImageView alloc] init];
        subPicture *subPic = self.subPictures[i];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cloudowr.oss-cn-hangzhou.aliyuncs.com/nsgcgl/420921/%@?x-oss-process=style/thumb_100_100", subPic.url]];
        // [img sd_setImageWithURL:url];
        [img sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"holderImage"]];
        img.frame = CGRectMake(imageX, imageY, imageW, imageH);
        
        [scrollView addSubview:img];
        
        allPicH = CGRectGetMaxY(img.frame);
        // 设置滚动区域
        CGFloat maxH = CGRectGetMaxY(img.frame) + imageW;
        scrollH = scrollH > maxH ? scrollH : maxH;
    }
    // NSLog(@"%f", scrollH);
    
    // 加载图片上传按钮
    CGFloat addBtnX = picMargin;
    CGFloat addBtnY = allPicH + picMargin;
    CGFloat addBtnW = imageW;
    CGFloat addBtnH = imageH;
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, addBtnW, addBtnH)];
    [addBtn setImage:[UIImage imageNamed:@"addPic"] forState:UIControlStateNormal];
    [scrollView addSubview:addBtn];
    
    scrollView.contentSize = CGSizeMake(0, scrollH);
    
    [addBtn addTarget:self action:@selector(addMorePic) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)addMorePic {
    NNavAddPicController *NavAddPic = [[NNavAddPicController alloc] init];
    
    NavAddPic.NNavAddPicInputID = self.NPictureInputID;
    NavAddPic.NNavAddPicProindex = self.NPictureProindex;
    NavAddPic.NNavAddPicUserID = self.NPictureUserID;
    
    [self presentViewController:NavAddPic animated:YES completion:nil];
}
//- (void)addMorePic {
//    // 系统自带的控制器
//    UIImagePickerController *pic = [[UIImagePickerController alloc] init];
//    pic.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    pic.delegate = self;
//    [self presentViewController:pic animated:YES completion:nil];
//}
//
//# pragma mark 图片选择控制器的代理方法
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
//    // 销毁  pic 控制器
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
