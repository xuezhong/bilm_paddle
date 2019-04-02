<h1 align="center">ELMO</h1>

## 介绍
ELMo是一种新型深度语境化词表征，可对词进行复杂特征(如句法和语义)和词在语言语境中的变化进行建模(即对多义词进行建模)。它解决了词表征模型的两个问题：一是词语用法在语义和语法上的复杂特点；二是随着语言环境的改变，这些用法也应该随之改变。

这种算法的特点是：每一个词语的表征都是整个输入语句的函数。具体做法就是先在大语料上以language model为目标训练出bidirectional LSTM模型，然后利用LSTM产生词语的表征。ELMo故而得名(Embeddings from Language Models)。为了应用在下游的NLP任务中，一般先利用下游任务的语料库(注意这里忽略掉label)进行language model的微调,这种微调相当于一种domain transfer; 然后才利用label的信息进行supervised learning。

## 安装使用

### 数据准备
利用download.sh下载词典和训练数据集和测试数据集。

### 第三方依赖安装

### 训练命令

## 预训练模型
Broadly speaking, the process to train and use a new biLM is:
1.Prepare input data and a vocabulary file.
2.Train the biLM.
3.Test (compute the perplexity of) the biLM on heldout data.
4.Write out the weights from the trained biLM to a hdf5 file.
5.See the instructions above for using the output from Step #4 in downstream models.

### 数据预处理

以中文模型的预训练为例，可基于中文维基百科数据构造具有上下文关系的句子对作为训练数据，用 [`tokenization.py`](tokenization.py) 中的 CharTokenizer 对构造出的句子对数据进行 token 化处理，得到 token 化的明文数据，然后将明文数据根据词典 [`vocab.txt`](data/demo_config/vocab.txt) 映射为 id 数据并作为训练数据，该示例词典和模型配置[`bert_config.json`](./data/demo_config/bert_config.json)均来自[BERT-Base, Chinese](https://bert-models.bj.bcebos.com/chinese_L-12_H-768_A-12.tar.gz)。

我们给出了 token 化后的示例明文数据: [`demo_wiki_tokens.txt`](./data/demo_wiki_tokens.txt)，其中每行数据为2个 tab 分隔的句子，示例如下:

```
1 . 雏 凤 鸣 剧 团   2 . 古 典 之 门 ： 帝 女 花 3 . 戏 曲 之 旅 ： 第 155 期 心 系 唐 氏 慈 善 戏 曲 晚 会 4 . 区 文 凤 , 郑 燕 虹 1999 编 ， 香 港 当 代 粤 剧 人 名 录 ， 中 大 音 乐 系 5 . 王 胜 泉 , 张 文 珊 2011 编 ， 香 港 当 代 粤 剧 人 名 录 ， 中 大 音 乐 系
```

同时我们也给出了 id 化后的部分训练数据：[`demo_wiki_train.gz`](./data/train/demo_wiki_train.gz)、和测试数据：[`demo_wiki_validation.gz`](./data/validation/demo_wiki_validation.gz)，每行数据为1个训练样本，示例如下:

```
1 7987 3736 8577 8020 2398 969 1399 8038 8021 3221 855 754 7270 7029 1344 7649 4506 2356 4638 676 6823 1298 928 5632 1220 6756 6887 722 769 3837 6887 511 2 4385 3198 6820 3313 1423 4500 511 2;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41;1
```

每个样本由4个 '`;`' 分隔的字段组成，数据格式: `token_ids; sentence_type_ids; position_ids; next_sentence_label`；

### 单机训练
利用提供的示例训练数据和测试数据，我们来说明如何进行单机训练。关于预训练的启动方式，可以查看脚本 `train.sh` ，该脚本已经默认以示例数据作为输入，以 GPU 模式进行训练。在开始预训练之前，需要把 CUDA、cuDNN、NCCL2 等动态库路径加入到环境变量 `LD_LIBRARY_PATH` 之中，然后按如下方式即可开始单机多卡预训练

```shell
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
./train.sh -local y
```

## 服务部署

## 参考论文
《Deep contextualized word representations》 https://arxiv.org/abs/1802.05365

## 版本更新

