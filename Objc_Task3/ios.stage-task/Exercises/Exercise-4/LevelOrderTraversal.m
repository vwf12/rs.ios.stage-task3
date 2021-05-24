#import "LevelOrderTraversal.h"

//@interface Node : NSObject
// 
//@property NSNumber *num;
//@property Node *left;
//@property Node *right;
// 
//- (Node *)initWithValue:(NSNumber *)value;
//- (Node *)getTreeFromPreorder:(NSArray *) preorder;
//- (NSMutableArray *)getLevelTraversal;
// 
//@end
//
//@implementation Node
// 
//- (Node *)initWithValue:(NSNumber *)value {
// 
//    self = [super init];
//    if (self != nil) {
//        self.num = value;
//        self.left = NULL;
//        self.right = NULL;
//    }
//    return self;
//}
//
//- (Node *)getTreeFromPreorder:(NSArray *)preorder {
//    if ([preorder count] <= GlobalIndex || preorder[GlobalIndex] == [NSNull null]) {
//        return nil;
//    }
//    
//    Node *root = [[Node alloc] initWithValue: preorder[GlobalIndex]];
//    
//    if (([preorder count] - 1) == GlobalIndex) {
//        return root;
//    }
//    
//    GlobalIndex++;
//    root.left = [[Node alloc] getTreeFromPreorder: preorder];
//    
//    GlobalIndex++;
//    root.right = [[Node alloc] getTreeFromPreorder: preorder];
//    
//    return root;
//}
//
//- (NSMutableArray *)getLevelTraversal {
//    
//    NSMutableArray *traversal = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.num, nil], nil];
//        
//    if (self.left != nil) {
//        NSArray *left = self.left.getLevelTraversal;
//        for (int i = 0; i < left.count; ++i) {
//            if (i < traversal.count - 1) {
//                [traversal[i + 1] addObjectsFromArray:left[i]];
//            } else {
//                [traversal addObject: left[i]];
//            }
//        }
//    }
//    
//    if (self.right != nil) {
//        NSArray *right = self.right.getLevelTraversal;
//        for (int i = 0; i < right.count; ++i) {
//            if (i < traversal.count - 1) {
//                [traversal[i + 1] addObjectsFromArray:right[i]];
//            } else {
//                [traversal addObject: right[i]];
//            }
//        }
//    }
//    
//    return traversal;
//}
// 
//@end
//
//int GlobalIndex = 0;
//
//NSArray *LevelOrderTraversalForTree(NSArray *tree) {
//    
//    GlobalIndex = 0;
//    Node *restoredTree = [[Node alloc] getTreeFromPreorder:tree];
//    
//    if (restoredTree) {
//        return [restoredTree getLevelTraversal];
//    } else {
//        return @[];
//    }
//}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    if (tree.count == 0 || (tree.count == 1 && tree[0] == [NSNull null])) {
        return [NSArray array];
        NSLog(@"nil");
    }
    NSMutableArray *sortedArray = [NSMutableArray new];
    NSMutableArray *eachLevelArray = [NSMutableArray array];
    NSInteger currentLevel = 0;
    NSInteger nullCounter = 0;
    
    for (int i=0; i < tree.count; i++) {
        if (i == 6) {
            NSLog(@"%@, current level: %ld", sortedArray, (long)currentLevel);
            NSLog(@"i=6");
        }
        if (tree[i] == [NSNull null]) {
            nullCounter += 1;
        }
        if (nullCounter != 2) {
            
//                NSLog(@"Sorted array count: %lu", (unsigned long)sortedArray.count);
            if (sortedArray.count < i+ 1) {
                [sortedArray addObject:[NSMutableArray new]];
            }
            
            [sortedArray[currentLevel] addObject:tree[i]];
            if (i == tree.count - 1) {
                break;
            }
            if (tree[i] != [NSNull null]) {
                
                nullCounter = 0;
                currentLevel += 1;
                
                [sortedArray addObject:[NSMutableArray new]];
            }
            while ([sortedArray[currentLevel] count] == 2) {
                if (currentLevel == 0) {
                    break;
                }
                currentLevel -= 1;
            }
            if (currentLevel == 0) {
                currentLevel +=1;
                while ([sortedArray[currentLevel] count] == 2) {
                    currentLevel += 1;
                }
            }
            
            
        }

        if (nullCounter == 2) {
            [sortedArray[currentLevel] addObject:tree[i]];
            NSLog(@"%@, current level: %ld", sortedArray, (long)currentLevel);
//            for (NSInteger i = currentLevel; i >=0; i--) {
//                currentLevel -= 1;
//            }
//
            while ([sortedArray[currentLevel] count] == 2) {
                currentLevel -= 1;
            }
            
            
            nullCounter = 0;
        }
    }
    NSMutableArray *finalArray = [NSMutableArray new];
    NSLog(@"Sorted: %@", sortedArray);
    for (int i = 0; i < sortedArray.count; i++) {
        [sortedArray[i] removeObjectIdenticalTo:[NSNull null]];
    }
    
    
    for (NSMutableArray *array in sortedArray) {
//            if  !(array.count == 1 && [array objectAtIndex:0] == [NSNull null]) {
        if (array.count != 0) {
            if ([array objectAtIndex:0] != [NSNull null]) {
                [finalArray addObject:array];
            }
            if (array.count == 2 && [array objectAtIndex:0] == [NSNull null]) {
                [array removeObjectAtIndex:0];
                [finalArray addObject:array];
            }
        }
//            }
    }
//        NSLog(@"%@", sortedArray);
    return  finalArray;
//    
//    
//    
//    
//    typedef struct {
//       int value;
//       struct TreeNode *left;
//       struct TreeNode *right;
//    } TreeNode;

//   -(NSMutableArray *)levelOrder:(TreeNode *)treeNode
//   {
//      NSMutableArray *levelOrderArray = [NSMutableArray array];
//      if (treeNode == nil) return levelOrderArray;
//
//      NSMutableArray *queue = [NSMutableArray array];
//      [queue addObject: treeNode];
//      while (queue.count != 0) {
//        NSMutableArray *eachLevelArray = [NSMutableArray array];
//        int size = queue.count;
//        for (int i = 0; i<size; i++) {
//           treeNode *node = [queue firstObject];
//           [queue removeObjectAtIndex: 0];
//           [eachLevelArray addObject: node];
//           if (node.left)  {
//             [queue addObject: node.left];
//           }
//           if (node.right) {
//             [queue addObject: node.right];
//           }
//        }
//        [levelOrderArray addObject: eachLevelArray];
//      }
//     return levelOrderArray;
//   }
//
//
//
//
    return nil;
}
