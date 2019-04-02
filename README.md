<h1 align="center">ELMO</h1>

## 介绍
ELMo是一种新型深度语境化词表征，可对词进行复杂特征(如句法和语义)和词在语言语境中的变化进行建模(即对多义词进行建模)。它解决了词表征模型的两个问题：一是词语用法在语义和语法上的复杂特点；二是随着语言环境的改变，这些用法也应该随之改变。

这种算法的特点是：每一个词语的表征都是整个输入语句的函数。具体做法就是先在大语料上以language model为目标训练出bidirectional LSTM模型，然后利用LSTM产生词语的表征。ELMo故而得名(Embeddings from Language Models)。为了应用在下游的NLP任务中，一般先利用下游任务的语料库(注意这里忽略掉label)进行language model的微调,这种微调相当于一种domain transfer; 然后才利用label的信息进行supervised learning。

## 安装使用
### 数据准备
### 第三方依赖安装
### 训练命令

## 预训练模型
FluidDoc 需要Paddle Repo的python模块去编译生成API文档。但由于Paddle的python模块过于庞大，超过了Travis CI允许的最大时长，通常Travis CI将会因为超时问题失败。这是Travis上有三项作业的原因，其中两项用于构建库。当Travis缓存了这些库以后，下一次的构建将会变得非常的快。

## 服务部署

## 参考论文
《Deep contextualized word representations》 https://arxiv.org/abs/1802.05365

## 版本更新

