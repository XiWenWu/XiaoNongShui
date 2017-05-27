//
//  NSearchController.m
//  xiaoNS
//
//  Created by 希文 on 2017/5/26.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "NSearchController.h"

@interface NSearchController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, assign) UIPickerView *pickerData;
// 显示的内容
@property (nonatomic, strong) NSArray *infos;
// 类型
@property (nonatomic, assign) UILabel *leixingLab;
// 县镇村
@property (nonatomic, assign) UILabel *countryLab;
// 确认按钮
@property (nonatomic, assign) UIButton *okeyBtn;

@end

@implementation NSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"查询";
    // 设置导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    [self addDataPicker];
    [self addChoiceControl];
    [self addOkeyBtn];
    
}

- (NSArray *)infos {
    if (_infos == nil) {
        _infos = @[@[@"全部", @"堰塘", @"泵站", @"渠道", @"饮水安全", @"水库", @"中小河流", @"堤防", @"渡槽", @"分水闸", @"隧洞", @"引水堰", @"水电站", @"倒虹管", @"抗旱水池"],@[@"全部", @"孝昌"]];
    }
    return _infos;
}

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addDataPicker {
    CGFloat dataX = 0;
    CGFloat dataY = 50;
    CGFloat dataW = viewW;
    CGFloat dataH = PickerViewH;
    UIPickerView *data = [[UIPickerView alloc] init];
    data.frame = CGRectMake(dataX, dataY, dataW, dataH);
    data.backgroundColor = [UIColor redColor];
    [self.view addSubview:data];
    data.dataSource = self;
    data.delegate = self;
    self.pickerData = data;
}

- (void)addChoiceControl {
    CGFloat maxH = CGRectGetMaxY(self.pickerData.frame);
    UILabel *leixing = [[UILabel alloc] init];
    leixing.frame = CGRectMake( margin, maxH + margin, viewW/3, labelH);
    leixing.text = @"类型：";
    leixing.backgroundColor = [UIColor greenColor];
    [self.view addSubview:leixing];
    
    CGFloat leixingLabX = CGRectGetMaxX(leixing.frame);
    UILabel *leixingLab = [[UILabel alloc] init];
    leixingLab.frame = CGRectMake( leixingLabX + margin, maxH + margin, viewW/3, labelH);
    leixingLab.backgroundColor = [UIColor greenColor];
    self.leixingLab = leixingLab;
    leixingLab.text = @"全部";
    [self.view addSubview:leixingLab];
    
    CGFloat countryH = CGRectGetMaxY(leixing.frame);
    UILabel *country = [[UILabel alloc] init];
    country.frame = CGRectMake( margin, countryH + margin, viewW/3, labelH);
    country.text = @"县/镇/村：";
    country.backgroundColor = [UIColor greenColor];
    [self.view addSubview:country];
    
    CGFloat countryLabX = CGRectGetMaxX(country.frame);
    UILabel *countryLab = [[UILabel alloc] init];
    countryLab.frame = CGRectMake( countryLabX + margin, countryH + margin, viewW/3, labelH);
    countryLab.backgroundColor = [UIColor greenColor];
    self.countryLab = countryLab;
    countryLab.text = @"全部";
    [self.view addSubview:countryLab];
    
}

- (void)addOkeyBtn {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 实现数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.infos.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *info = self.infos[component];
    return info.count;
}

#pragma mark 实现代理方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.infos[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%ld--%ld", row, component);
    NSLog(@"%@", self.infos[component][row]);
    if (component == 0) {
        self.leixingLab.text = self.infos[component][row];
    } else if (component == 1) {
        self.countryLab.text = self.infos[component][row];
    }
    
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
