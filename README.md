# ANDistributedFlowLayout

ANDistributedFlowLayout is a subclass of UICollectionViewFlowLayout which distributes cells evenly in across each row.

### Usage

```ruby
# In your Podfile

pod 'ANDistributedFlowLayout'
```

Objective-C:

```objective-c
ANDistributedFlowLayout *layout = [ANDistributedFlowLayout new];
layout.minimumInteritemSpacing = 10.f;
layout.minimumLineSpacing = 10.f;

[[UICollectionViewController alloc] initWithCollectionViewLayout:layout];
```

Swift:

```swift
let layout = ANDistributedFlowLayout()
layout.minimumInteritemSpacing = 10.0
layout.minimumLineSpacing = 10.0

UICollectionViewController(collectionViewLayout: layout)
```

### Example

See the layout in use in the `./Example` app:

![](https://github.com/keighl/KTCenterFlowLayout/raw/master/example.png)
