//
//  FormDemo2VC.m
//  JhReader
//
//  Created by Jh on 2019/3/12.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo2VC.h"
#import "Masonry.h"
#import "JhBaseHeaderView.h"

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface FormDemo2VC ()

/** 按钮 */
@property (nonatomic, strong) UIView *btnBgView;
//@property (nonatomic, strong) JhPositionButton *btn1;
//@property (nonatomic, strong) JhPositionButton *btn2;

@end

@implementation FormDemo2VC

-(void)dealloc{
    NSLog(@" FormDemo2VC - dealloc ");
}

-(UIView *)btnBgView{
    if (!_btnBgView) {

        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor =JhRandomColor;

//        JhPositionButton *btn1 = [[JhPositionButton alloc]init];
//        [btn1 setTitle:@"选项一" forState:UIControlStateNormal];
//        btn1.titleLabel.font = JhFontsize(15);
//        [btn1 setTitleColor:BaseBlackTextColor forState:UIControlStateNormal];
//        btn1.JhTextHorizontalAlignmentStyle = JhTextAlignmentLeft;
//        btn1.ButtonPositionStyle = JhButtonStyleLeftImageRightTitle;
//        [btn1 setImage:[UIImage imageNamed:@"checkbox_normal"] forState:UIControlStateNormal];
//        [btn1 setImage:[UIImage imageNamed:@"checkbox_selected"] forState:UIControlStateSelected];
//        [btn1 addTarget:self action:@selector(ClickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [bgView addSubview:btn1];
//
//        JhPositionButton *btn2 = [[JhPositionButton alloc]init];
//        [btn2 setTitle:@"选项二" forState:UIControlStateNormal];
//        btn2.titleLabel.textAlignment = NSTextAlignmentLeft;
//        btn2.titleLabel.font = JhFontsize(15);
//        [btn2 setTitleColor:BaseBlackTextColor forState:UIControlStateNormal];
//        btn2.ButtonPositionStyle = JhButtonStyleLeftImageRightTitle;
//        btn2.JhTextHorizontalAlignmentStyle = JhTextAlignmentLeft;
//        [btn2 setImage:[UIImage imageNamed:@"checkbox_normal"] forState:UIControlStateNormal];
//        [btn2 setImage:[UIImage imageNamed:@"checkbox_selected"] forState:UIControlStateSelected];
//        [btn2 addTarget:self action:@selector(ClickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [bgView addSubview:btn2];
//
//        NSInteger padding = 0;
//        [@[btn1, btn2] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:padding leadSpacing:padding tailSpacing:padding];
//
//        [@[btn1, btn2] mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(bgView).offset(0);
//            make.bottom.equalTo(bgView).offset(0);
//        }];
//
//        _btn1 = btn1;
//        _btn2 = btn2;
        _btnBgView = bgView;
    }
    return _btnBgView;
}
- (void)ClickSelectBtn:(UIButton *)button {
    button.selected = !button.selected;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"表单Demo2 - 自定义cell";
    
    [self initModel];
    
}






#pragma mark - initModel
-(void)initModel{
    
    
    __weak typeof(self) weakSelf = self;
    
    
    //第一组
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    //右侧自定义View
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = JhRandomColor;

    
    JhFormCellModel *cell0 = JhFormCellModel_AddCustumRightCell(@"右侧自定义:");
    cell0.Jh_defaultHeight = 60;
    cell0.Jh_custumRightViewBlock = ^(UIView *RightView) {
        [RightView  addSubview:rightView];
        [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
    };
    
    
    //底部自定义View
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = JhRandomColor;
    
    JhFormCellModel *cell1 = JhFormCellModel_AddCustumBottomCell(@"底部自定义:");
    cell1.Jh_defaultHeight = 200;
    cell1.Jh_custumBottomViewBlock = ^(UIView *BottomView) {
        [BottomView addSubview:bottomView];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
    };
    
    [cellArr0 addObjectsFromArray: @[cell0,cell1]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    JhBaseHeaderView *headerV = [[JhBaseHeaderView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 44)];
    headerV.backgroundColor = BaseBgWhiteColor;
    headerV.Jh_leftTitle = @"第一组头部";
    section0.Jh_headerView = headerV;
    section0.Jh_headerHeight= headerV.bounds.size.height;
    
    JhBaseHeaderView *footerV = [[JhBaseHeaderView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 44)];
    footerV.backgroundColor = BaseBgWhiteColor;
    footerV.Jh_leftTitle = @"第一组尾部";
    section0.Jh_footerView = footerV;
    section0.Jh_footerHeight= footerV.bounds.size.height;
    
    
    
    //第二组
    NSMutableArray *cellArr1 = [NSMutableArray array];
    
    //右侧自定义View
    JhFormCellModel *Section1_cell0 = JhFormCellModel_AddCustumRightCell(@"右侧自定义带箭头:");
    Section1_cell0.Jh_custumRightViewBlock = ^(UIView *RightView) {
        [RightView  addSubview:weakSelf.btnBgView];
        [weakSelf.btnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
        
    };
    Section1_cell0.Jh_custumRightCellShowArrow =YES;
    
    //设置宽度
    

    JhFormCellModel *Section1_cell1 = JhFormCellModel_AddInputCell(@"统一社会信用代码:",nil, YES, UIKeyboardTypeDecimalPad);
    Section1_cell1.Jh_placeholder = @"请输入18位统一社会信用代码";
    Section1_cell1.Jh_maxInputLength = 18;
    Section1_cell1.Jh_titleWidth = 120;     //单个设置左侧title的宽度
    self.Jh_leftTitleWidth = 120;           //统一设置左侧title的宽度
    
    //文本居中
    JhFormCellModel *Section1_cell2 = JhFormCellModel_AddCenterTextCell(@"退出登录");
    Section1_cell2.Jh_defaultHeight = 60;
    Section1_cell2.JhCellClickCenterTextBlock = ^{
          NSLog(@" 点击了退出登录 ");
//        [JhProgressHUD showText:@"点击了退出登录"];
    };
    
    [cellArr1 addObjectsFromArray: @[Section1_cell0,Section1_cell1,Section1_cell2]];
    JhFormSectionModel *section1 = JhSectionModel_Add(cellArr1);
    

    
    JhBaseHeaderView *headerV2 = [[JhBaseHeaderView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 44)];
    headerV2.backgroundColor = BaseBgWhiteColor;
    headerV2.Jh_leftTitle = @"第二组头部";
    headerV2.Jh_rightBtnTitle = @"更多";
    headerV2.JhHeaderClickRightBtnBlock = ^{
        NSLog(@" 点击更多按钮 ");
//         [JhProgressHUD showText:@"点击更多按钮"];
    };
    section1.Jh_headerView = headerV2;
    section1.Jh_headerHeight= headerV2.bounds.size.height;
    
        
    [self.Jh_formModelArr addObject:section0];
    [self.Jh_formModelArr addObject:section1];
    
    
    self.Jh_submitStr = @"提 交";
    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
//         [JhProgressHUD showText:@"点击提交按钮"];
    };
    
    
    
    if (@available(iOS 13.0, *)) {
        
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            headerV.backgroundColor = [UIColor systemBackgroundColor];
            footerV.backgroundColor = [UIColor systemBackgroundColor];
            headerV2.backgroundColor = [UIColor systemBackgroundColor];
        }else {
            headerV.backgroundColor = BaseBgWhiteColor;
            footerV.backgroundColor = BaseBgWhiteColor;
            headerV2.backgroundColor = BaseBgWhiteColor;
        }
    }
    
    
    
    
}

#pragma mark - 提交请求
-(void)SubmitRequest{
    
    
    
}



@end
