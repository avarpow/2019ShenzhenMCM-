#2019深圳杯
##待研究的问题
现有一个32单元相控天线阵列，移相器配置有4种方式（0°，90°，180°，270°）。采用仪器测量每种相位配置下的3D空间分布（数据参见附件一）。使用数据时需要考虑数据中存在的测量误差：移相器配置为90°和180°，两者信号相差（90+/- err）°，其中err为测量误差。

数据预处理排除测量错误数据

###微波问题1
    假设：
    1. 合成功率为35dBm；
    2. 旁瓣电平尽可能低；
    3. 可以选择关闭某些通道；
    4.在位置AZ=10°，俯仰EL=10°处有一站点，波束设计时避免对该站点的干扰。
    请给出方位（水平角AZ=10°，俯仰角EL=5°）对应的波束配置（移相器配置矢量〖z=[∆〗_1,…,∆_N]）。

---

目标函数T=u_1 (E) u_2 (E_S ) u_3 (E_d )
u_1 (E)={█(1 E≥35@0 E<35)┤满足条件1与否
u_2 (E_S )=E_S/E信噪比尽可能大
u_3 (E_d )=1/E_d 干扰项尽可能小

E=∑_(i=1)^32▒e_(ij_i ) 
对于每一个波束，有五种配置方式（关闭波束，移相器配置1，配置2，配置3，配置4）
	采用遗传算法，搜索目标函数最大值点。
	
	微波问题2
    波束配置矢量要求：1. 整个覆盖区域内，平均辐射功率35dBm；2. 波束覆盖的“凹坑”尽可能小；3. 覆盖波束个数尽可能少；4. 用尽可能少的波束，覆盖水平角±30°，俯仰角±15°的区域。请给出波束配置列表[z_1,z_2,…,z_(M])（M为波束个数）。
    对于问题3：先评判最少需要的波束个数，再采用二分法找到尽可能小的波束

	骨干网问题1
    随着众多网络接入技术的发展，以及未来用户数据需求量呈指数形式的增长，城市之间的骨干网输入输出端口带宽与容量需求也将爆炸式增长。使用最新的通信技术升级改造骨干网已成为运营商应对未来通信市场需求的一个迫在眉睫的举动。
现需要在广东省对已有骨干网进行满足电信市场要求的改造。个人信息接入需求量会随着新科技在群众中的接受度，科技自身更迭速度等因素变化；同时各个年龄段，各收入阶层对信息需求量也有不同。请预估未来十年（截止2028年）信息时代各类人群所需要的信息量，以满足广东省全部人口的信息接入需求为目标，省会广州市为数据中心，选择性地用最新的通信技术更新从广州到其余主要行政城市的骨干网络。（城市之间连接的城际网可选用的调制格式及其特性见附件二中）。请参考广东省一些相关数据，自我构造约束条件，为广东省未来电信市场建立一个有效的部署价值函数，用这个价值函数寻找到网络价值最大化的部署方案。作为电信从业人员网络部署设计方案的参考。

采用层次分析法分析个人信息接入需求量
微分方程分析预估未来十年各类人群所需要的信息量。
聚类分析找到人口群体，在人口群之间建立骨干网，层次分析法分析价值函数
	骨干网问题2
某通信公司曾提出：“建立一个万物互联的世界”。而在现实社会中，站在运营商角度，每个人的接入价值是不一样的，不同收入、地区、年龄的人接入成本和数据需求都不一样。如果将不同人群的网络接入价值也纳入考虑，并选择性的接入网络价值大的人群，请重新构建网络价值函数，并找到新的最优部署方案。
建立利润函数
利润=价值-成本





