<h1 align="center">ELMO</h1>

## 介绍
ELMO(Embeddings from Language Models)是一种新型深度语境化词表征，可对词进行复杂特征(如句法和语义)和词在语言语境中的变化进行建模(即对多义词进行建模)。该模型支持多卡训练，训练速度比主流实现快1倍,  验证在中文词法分析任务上提升0.7%的精度。
ELMO把每一个词语的表征都是整个输入语句的函数，在大语料上以language model为训练目标训练出bidirectional LSTM模型，然后利用LSTM产生词语的表征。为了应用在下游的NLP任务中，一般先利用下游任务的语料库进行language model的微调，然后才利用label的信息进行supervised learning。


## 安装使用
下载代码后，把elmo训练任务跑起来，分为三步：
1.下载数据集和字典文件
2.安装依赖库
3.启动脚本训练模型

### 基本配置版本
python 2.7
paddlepaddle lastest版本

### 数据准备
利用download.sh下载词典和训练数据集和测试数据集。
```shell
cd data && bash download.sh
```

### 第三方依赖安装
```shell
bash download_thirdparty.sh
```

### 训练模型
```shell
sh run.sh
```

## 预训练模型
预训练模型要点：
1.准备训练数据集trainset和测试数据集testset，准备一份词表如data/vocalubary.txt。
2.训练模型
3.测试模型结果
4.把checkpoint结果写入文件中。
5.把LEMO权重结果接入到其他NLP任务中。

### 数据预处理

以中文模型的预训练为例，可基于中文维基百科数据作为训练数据，先切成句子，在根据词典做分词。
```
本 书 介绍 了 中国 经济 发展 的 内外 平衡 问题 、 亚洲 金融 危机 十 周年 回顾 与 反思 、 实践 中 的 城乡 统筹 发展 、 未来 十 年 中国 需要 研究 的 重大 课题 、 科学 发展 与 新型 工业 化 等 方面 。
```
```
吴 敬 琏 曾经 提出 中国 股市 “ 赌场 论 ” ， 主张 维护 市场 规则 ， 保护 草根 阶层 生计 ， 被 誉 为 “ 中国 经济 学界 良心 ” ， 是 媒体 和 公众 眼中 的 学术 明星 
```

### 单机训练
模型支持单机多卡训练，需要在run.sh里export CUDA_VISIBLE_DEVICES设置指定卡,如下所示：
```shell
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
```

## 参考论文
《Deep contextualized word representations》 https://arxiv.org/abs/1802.05365
