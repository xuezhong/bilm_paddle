export CUDA_VISIBLE_DEVICES=3 
FLAGS_debug_print=false python  train.py \
--train_path='baike/train/sentence_file_*'  \
--test_path='baike/dev/sentence_file_*'  \
--vocab_path baike/vocabulary_min5k.txt \
--learning_rate 0.2 \
--use_gpu True \
--sample_softmax --local True --dropout 0.0 --shuffle True --random_seed 0 $@
