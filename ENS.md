# ENS（Ethereum Name Service）

## 什么是ENS？

​		ENS的功能类似我们比较熟悉的 DNS(domain name service)网域名称服务，但提供的不是Internet网址，而是将以太坊钱包地址和智能合约地址以 xxx.eth网址的方式表示，并且可以用于转账或存取智能合约等地方。

## ENS申请流程

- 注册 ENS 网域并不需要实名或其他认证流程，只要一个以太钱包地址即可

  ​		PS：绝对不要用交易提供的钱包竞标ENS，不然使用竞标到网域也会成为交易所的网域。

- ENS网域的最低起标价是0.01ETH（当前大概11美金左右）

- 要注册ENS网域，需要遵循ENS网域竞标流程（bid）。

  ![image-20220706141918900](/Users/zhangxiangyu/Library/Application Support/typora-user-images/image-20220706141918900.png)

  ​		ENS网域竞标流程模拟现实的竞标，首先是写下标价，并将相应数量的以太币传入ENS票箱，三天后就可以公告这个网域竞标，其他人看到网域已经开始竞标，若有兴趣，则会加入这个网域竞标，最终价高者得，但是出价最高的人只需要缴纳第二高的标价，ENS会自动退回所有参与者的标金，也会返回标者标金的差额，如果的标者一年后未续约，ENS将释放出此网域并退回押金。

  