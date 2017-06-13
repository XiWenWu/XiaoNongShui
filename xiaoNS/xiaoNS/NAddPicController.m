//
//  NAddPicController.m
//  xiaoNS
//
//  Created by 希文 on 2017/6/2.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NAddPicController.h"
#import "NWorkController.h"

//
// 工具
#import "AFHTTPSessionManager.h"
#import "MBProgressHUD+MJ.h"



@interface NAddPicController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *addBtn;

///**  */
//@property (nonatomic, assign) NSInteger URLUserID;
///**  */
//@property (nonatomic, assign) NSInteger URLProindex;
///**  */
//@property (nonatomic, assign) NSInteger URLInputid;

@end

@implementation NAddPicController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopBtn];
    
    [self addPicBtn];
    
    [self addImagePicker];
    
}

- (void)setTopBtn {
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"上传图片";
    // 设置导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStyleDone target:self action:@selector(add)];
}

- (void)addPicBtn {
    
    UIButton *addBtn = [[UIButton alloc] init];
    addBtn.frame = CGRectMake(Nmargin, 64+Nmargin, sizeH, sizeH);
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    addBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:addBtn];
    [addBtn addTarget:self action:@selector(openImagePicker) forControlEvents:UIControlEventTouchUpInside];
    self.addBtn = addBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)add {
    NSLog(@"%ld----%ld----%ld", self.NAddPicInputID, self.NAddPicProindex, self.NAddPicUserID);
    if (self.imageView.image) {
        
        // http://www.cloudowr.com:8801/nsgcgl/api/v3/uploadImg?key=android&userid=1102&input.id=0&proindex=4
        //NSURL *url = [NSURL URLWithString:@"http://www.cloudowr.com:8801/nsgcgl/api/v3/uploadImg?key=android&userid=1102&input.id=0&proindex=4"];
        // 上传
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

        NSString *url = [NSString stringWithFormat:@"http://www.cloudowr.com:8801/nsgcgl/api/v3/uploadImg?key=android&userid=%ld&input.id=%ld&proindex=%ld", self.NAddPicUserID, self.NAddPicInputID, self.NAddPicProindex];

        [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            // 在请求之前调用block  必须在这里说明上传的文件
        //        NSData *data = UIImagePNGRepresentation(self.imageView.image);
        //        [formData appendPartWithFileData:data name:@"png" fileName:@"test.png" mimeType:@"image/png"];
            NSData *data = UIImageJPEGRepresentation(self.imageView.image, 0.1);
            [formData appendPartWithFileData:data name:@"jpeg" fileName:@"test.jpeg" mimeType:@"image/jpeg"];
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uploadProgress = %@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"上传成功");
            NSLog(@"%@", responseObject);
            [MBProgressHUD showSuccess:@"上传成功"];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"上传失败");
            [MBProgressHUD showError:@"上传失败"];
        }];

        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}



- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)openImagePicker {
    // 系统自带的控制器
    UIImagePickerController *pic = [[UIImagePickerController alloc] init];
    pic.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pic.delegate = self;
    [self presentViewController:pic animated:YES completion:nil];
}

# pragma mark 图片选择控制器的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *pickerImg = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = pickerImg;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)addImagePicker {
    CGFloat imageX = self.addBtn.frame.origin.x;
    CGFloat imageY = CGRectGetMaxY(self.addBtn.frame) + Nmargin;
    CGFloat imageW = self.addBtn.frame.size.width;
    CGFloat imageH = self.addBtn.frame.size.height;
    
    UIImageView *image = [[UIImageView alloc] init];
    image.frame = CGRectMake(imageX, imageY, imageW, imageH);
    [self.view addSubview:image];
    self.imageView = image;
    
    
    
}

@end
