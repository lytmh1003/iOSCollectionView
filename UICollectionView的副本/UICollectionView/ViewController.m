//
//  ViewController.m
//  UICollectionView
//
//  Created by 李育腾 on 2022/6/7.
//

#import "ViewController.h"
#import "enjoyLayout.h"
#import "CircleLayout.h"
@interface ViewController ()
@property (nonatomic, strong)UICollectionView *collectView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//
// UICollectionView 只是简单的纵向排列，存在很多的局限性，对于一些更加复杂的布局样式，就有些力不从心了，UItableView每一行只能有一个数据载体cell，不支持在一行中排列多个数据载体，对于这些复杂的布局要求，UICollectionView可以提供更好的支持
    
    // UICollectionView的优势
    // 1.支持水平方向和竖直方向两个方向的布局
    // 2.通过UICollectionViewLayout类 配置的方式进行界面布局
    // 3.UICollectionView 的载体 item的大小和位置更加灵活
    // 4.通过 UICollectionViewLayoutDelegate 协议方法，可以动态的对布局进行重新设置
    // 5.支持完全自定义的UICollectionViewLayout子类来进行各种复杂的布局
    
// UICollectionViewLayout的九宫格
    // 创建布局策略
    // UICollectionViewFlowLayout 是系统提供的流式布局类
    // UICollectionViewFlowLayout 的 scrollDirection 提供方向的布局
//    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
//    enjoyLayout *layout = [[enjoyLayout alloc] init];
    CircleLayout *layout = [[CircleLayout alloc] init];
    // 设置布局方向,横行和竖行都有
    // Vertical - 竖直
    // Horizontal 横向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.itemCount = 32;
    // 设置每个载体Item的尺寸
//    layout.itemSize = CGSizeMake((self.view.frame.size.width) / 3 - 10, (self.view.frame.size.width) / 3 - 10);
//    layout.itemSize = CGSizeMake(150, 150);
//
    //cell横向间距
//    layout.minimumLineSpacing = 20;
    
    // cell纵向间距
//    layout.minimumInteritemSpacing = 20;
    
    //cell到容器边缘的距离
//    layout.sectionInset = UIEdgeInsetsMake(7, 5, 7, 5);
    
    //创建UICollectionView 视图控件
    self.collectView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    // 进行数据载体Item注册·必须注册·
    [self.collectView registerClass:[UICollectionViewCell class]  forCellWithReuseIdentifier:@"cellId"];
    
    // 设置代理和数据源，参考UItableView
    self.collectView.delegate = self;
    self.collectView.dataSource = self;
    [self.view addSubview: self.collectView];

}


// 几 组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 此处应该是每组的元素的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row % 2 == 0) {
//        return CGSizeMake(50, 50);
//    } else {
//        return CGSizeMake(80, 80);
//    }
//}
-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath ];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 25;
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
    return cell;;
}
@end
